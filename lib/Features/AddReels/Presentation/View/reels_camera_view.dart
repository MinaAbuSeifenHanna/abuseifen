import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypelify_v2/Core/Constants/asset_strings.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';
import 'package:hypelify_v2/Features/AddReels/Presentation/Bloc/CameraBloc/reels_camera_bloc.dart';
import 'package:hypelify_v2/Features/AddReels/Presentation/Bloc/add_reels_bloc.dart';
import 'package:hypelify_v2/Features/AddReels/Presentation/Widgets/share_new_reel.dart';

import '../../../../Core/Widget/app_appBar.dart';

class ReelsCameraView extends StatefulWidget {
  const ReelsCameraView({super.key});

  @override
  State<ReelsCameraView> createState() => _ReelsCameraViewState();
}

class _ReelsCameraViewState extends State<ReelsCameraView> {
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
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ReelsCameraBloc cameraBloc = context.read<ReelsCameraBloc>();
    final AddReelsBloc addReelsBloc = context.read<AddReelsBloc>();
    return Scaffold(
      body: BlocProvider<ReelsCameraBloc>(
        create: (context) => cameraBloc,
        child: BlocConsumer<ReelsCameraBloc, ReelsCameraState>(
          builder: (context, cameraState) {
            return BlocBuilder<AddReelsBloc, AddReelsState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      child: _isCameraInitialized
                          ? Stack(
                              fit: StackFit.expand,
                              alignment: Alignment.bottomCenter,
                              children: [
                                Positioned.fill(
                                  child: AspectRatio(
                                    aspectRatio: _controller.value.aspectRatio,
                                    child: CameraPreview(
                                      _controller,
                                    ),
                                  ),
                                ),
                                if (cameraState.isRecording)
                                  Positioned(
                                    top: mediaQueryData.viewPadding.top + 10,
                                    right: 10,
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: const BoxDecoration(
                                        color: AppColors.errorColor,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                SafeArea(
                                  child: Column(
                                    children: [
                                      GenralAppbar(
                                        title: '',
                                        onPressed: () => Navigator.pop(context),
                                      ).setHorizontalPadding(context, 0.03),
                                      const Spacer(),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              if (_currentFlashMode ==
                                                  FlashMode.off) {
                                                _controller.setFlashMode(
                                                    FlashMode.torch);
                                                setState(() {
                                                  _currentFlashMode =
                                                      FlashMode.torch;
                                                });
                                              } else {
                                                _controller.setFlashMode(
                                                    FlashMode.off);
                                                setState(() {
                                                  _currentFlashMode =
                                                      FlashMode.off;
                                                });
                                              }
                                            },
                                            icon:
                                                Image.asset(IconStrings.light),
                                          ),
                                          Bounceable(
                                            child: Container(
                                              height: 80.sp,
                                              width: 80.sp,
                                              decoration: BoxDecoration(
                                                color: AppColors.natural100
                                                    .withOpacity(0.3),
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
                                            onTap: () async {
                                              if (!cameraState.isVideo) {
                                                _controller
                                                    .takePicture()
                                                    .then((XFile? file) {
                                                  if (file != null) {
                                                    cameraBloc.add(CaptureEvent(
                                                        file: File(file.path)));
                                                  }
                                                });
                                              } else {
                                                if (cameraState.isRecording) {
                                                  cameraBloc.add(
                                                      PauseRecordingEvent());
                                                  await _controller
                                                      .pauseVideoRecording();
                                                } else if (!cameraState
                                                        .isRecording &&
                                                    !cameraState
                                                        .startedRecording) {
                                                  cameraBloc.add(
                                                      StartRecordingEvent());
                                                  await _controller
                                                      .startVideoRecording();
                                                } else if (!cameraState
                                                        .isRecording &&
                                                    cameraState
                                                        .startedRecording) {
                                                  cameraBloc.add(
                                                      StartRecordingEvent());
                                                  await _controller
                                                      .resumeVideoRecording();
                                                }
                                              }
                                            },
                                          ),
                                          if (cameraState.isRecording)
                                            IconButton(
                                              onPressed: () async {
                                                cameraBloc
                                                    .add(PauseRecordingEvent());
                                                _controller
                                                    .stopVideoRecording()
                                                    .then((file) {
                                                  cameraBloc.add(CaptureEvent(
                                                      file: File(file.path)));
                                                });
                                              },
                                              icon: Container(
                                                height: 80.sp,
                                                width: 80.sp,
                                                decoration: BoxDecoration(
                                                  color: AppColors.natural100
                                                      .withOpacity(0.3),
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: Alignment.center,
                                                child: Container(
                                                  height: 30.sp,
                                                  width: 30.sp,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: AppColors.errorColor,
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (_cameras.length > 1)
                                            IconButton(
                                              onPressed: () {
                                                _controller.description ==
                                                        _cameras.first
                                                    ? _controller
                                                        .setDescription(
                                                            _cameras[1])
                                                    : _controller
                                                        .setDescription(
                                                            _cameras.first);
                                              },
                                              icon: Image.asset(
                                                  IconStrings.change_camera),
                                            ),
                                        ],
                                      ).setHorizontalAndVerticalPadding(
                                          context, 0.03, 0.01),
                                      Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.1,
                                        decoration: const BoxDecoration(
                                            color: AppColors.textBlack),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                cameraBloc.add(
                                                    SetCameraTypeEvent(
                                                        isVideo: true));
                                              },
                                              child: Text(
                                                'Video',
                                                style: textTheme.titleSmall!
                                                    .copyWith(
                                                  color: cameraState.isVideo
                                                      ? AppColors.natural100
                                                      : AppColors.natural400,
                                                  fontWeight:
                                                      cameraState.isVideo
                                                          ? FontWeight.bold
                                                          : FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                cameraBloc.add(
                                                    SetCameraTypeEvent(
                                                        isVideo: false));
                                              },
                                              child: Text(
                                                'Image',
                                                style: textTheme.titleSmall!
                                                    .copyWith(
                                                  color: !cameraState.isVideo
                                                      ? AppColors.natural100
                                                      : AppColors.natural400,
                                                  fontWeight:
                                                      !cameraState.isVideo
                                                          ? FontWeight.bold
                                                          : FontWeight.normal,
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
                    ),
                  ],
                );
              },
            );
          },
          listener: (context, state) {
            if (state is CaptureState) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: addReelsBloc,
                    child: ShareNewReel(file: state.file),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
