import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypelify_v2/Core/Constants/asset_strings.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddStoryView extends StatefulWidget {
  const AddStoryView({super.key});

  @override
  State<AddStoryView> createState() => _AddStoryViewState();
}

class _AddStoryViewState extends State<AddStoryView> {
  late List<CameraDescription> _cameras;
  late CameraController _controller;
  bool _isCameraInitialized = false;
  FlashMode _currentFlashMode = FlashMode.off;

  @override
  void initState() {
    super.initState();
    Future(() {
      _initializeCamera();
    });
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(
      _cameras.first,
      ResolutionPreset.high,
    );
    await _controller.initialize();
    setState(() {
      _isCameraInitialized = true;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    if (!_controller.value.isInitialized) {
      return;
    }

    final image = await _controller.takePicture();
    _showImagePreview(image.path);
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _showImagePreview(pickedFile.path);
    }
  }

  void _showImagePreview(String path) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ImagePreviewScreen(imagePath: path),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: _isCameraInitialized
          ? Stack(
              fit: StackFit.expand,
              alignment: Alignment.bottomCenter,
              children: [
                Positioned.fill(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: CameraPreview(_controller),
                  ),
                ),
                SafeArea(
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(IconStrings.settings),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Image.asset(IconStrings.back),
                          ),
                        ],
                      ).setHorizontalAndVerticalPadding(context, 0.03, 0.01),
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(IconStrings.upload_image),
                          ),
                          IconButton(
                            onPressed: () {
                              if (_currentFlashMode == FlashMode.off) {
                                _controller.setFlashMode(FlashMode.torch);
                                setState(() {
                                  _currentFlashMode = FlashMode.torch;
                                });
                              } else {
                                _controller.setFlashMode(FlashMode.off);
                                setState(() {
                                  _currentFlashMode = FlashMode.off;
                                });
                              }
                            },
                            icon: Image.asset(IconStrings.light),
                          ),
                          Container(
                            height: 80.sp,
                            width: 80.sp,
                            decoration: BoxDecoration(
                              color: AppColors.natural100.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Container(
                              height: 56.sp,
                              width: 56.sp,
                              decoration: const BoxDecoration(
                                color: AppColors.natural100,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          if (_cameras.length > 1)
                            IconButton(
                              onPressed: () {
                                _controller.description == _cameras.first
                                    ? _controller.setDescription(_cameras[1])
                                    : _controller.setDescription(_cameras.first);
                              },
                              icon: Image.asset(IconStrings.change_camera),
                            ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(IconStrings.face_masks),
                          ),
                        ],
                      ).setHorizontalAndVerticalPadding(context, 0.03, 0.01),
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height * 0.1,
                        decoration: const BoxDecoration(color: AppColors.textBlack),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Type',
                                style: textTheme.titleSmall!.copyWith(
                                  color: AppColors.natural400,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Live',
                                style: textTheme.titleSmall!.copyWith(
                                  color: AppColors.natural400,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Normal',
                                style: textTheme.titleSmall!.copyWith(
                                  color: AppColors.natural100,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Boomerang',
                                style: textTheme.titleSmall!.copyWith(
                                  color: AppColors.natural400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class ImagePreviewScreen extends StatelessWidget {
  final String imagePath;

  const ImagePreviewScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Preview')),
      body: Center(
        child: Image.file(File(imagePath)),
      ),
    );
  }
}
