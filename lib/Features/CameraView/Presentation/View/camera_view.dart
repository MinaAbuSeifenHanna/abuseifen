import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hypelify_v2/Core/Constants/asset_strings.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';
import 'package:hypelify_v2/Core/Widget/app_appBar.dart';
import 'package:hypelify_v2/Features/CameraView/Presentation/Bloc/camera_bloc.dart';
import 'package:lottie/lottie.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  late List<CameraDescription> _cameras;
  late CameraController _controller;
  bool _isCameraInitialized = false;
  late TextTheme textTheme = Theme.of(context).textTheme;
  late CameraBloc cameraBloc = context.read();

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
    return Scaffold(
      body: _isCameraInitialized
          ? BlocConsumer<CameraBloc, CameraState>(
              listener: (context, state) {
                if (state is CaptureState) {
                  Navigator.pop(context, state.file);
                }
              },
              builder: (context, cameraState) {
                return Stack(
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
                    SafeArea(
                      child: Column(
                        children: [
                          GenralAppbar(
                            title: '',
                            onPressed: () => Navigator.pop(context),
                            action: (cameraState.isRecording)
                                ? Lottie.asset(
                                    IconStrings.isRecording,
                                    width: 25,
                                    fit: BoxFit.fitWidth,
                                  )
                                : null,
                          ).setHorizontalPadding(context, 0.03),
                          const Spacer(),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset(IconStrings.upload_image),
                              ),
                              if (cameraState.startedRecording)
                                IconButton(
                                  onPressed: () async {
                                    if (cameraState.isRecording) {
                                      cameraBloc.add(PauseRecordingEvent());
                                      await _controller.pauseVideoRecording();
                                    } else if (!cameraState.isRecording && cameraState.startedRecording) {
                                      cameraBloc.add(StartRecordingEvent());
                                      await _controller.resumeVideoRecording();
                                    }
                                  },
                                  icon: Icon(
                                    cameraState.isRecording ? FontAwesomeIcons.pause : FontAwesomeIcons.play,
                                    color: AppColors.natural100,
                                  ),
                                ),
                              Bounceable(
                                child: Container(
                                  height: 80.sp,
                                  width: 80.sp,
                                  decoration: BoxDecoration(
                                      color: AppColors.natural100,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: cameraState.isRecording
                                            ? AppColors.errorColor.withOpacity(0.5)
                                            : AppColors.natural500.withOpacity(0.3),
                                        width: 10.sp,
                                      )),
                                ),
                                onTap: () async {
                                  if (!cameraState.isVideo) {
                                    _controller.takePicture().then((XFile? file) {
                                      if (file != null) {
                                        cameraBloc.add(CaptureEvent(file: File(file.path)));
                                      }
                                    });
                                  } else {
                                    if (!cameraState.isRecording && !cameraState.startedRecording) {
                                      cameraBloc.add(StartRecordingEvent());
                                      await _controller.startVideoRecording();
                                    }
                                  }
                                },
                              ),
                              if (cameraState.startedRecording)
                                IconButton(
                                  onPressed: () async {
                                    cameraBloc.add(PauseRecordingEvent());
                                    _controller.stopVideoRecording().then((file) {
                                      cameraBloc.add(CaptureEvent(file: File(file.path)));
                                    });
                                  },
                                  icon: Container(
                                    height: 20.sp,
                                    width: 20.sp,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                      color: AppColors.errorColor,
                                      shape: BoxShape.rectangle,
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
                                  onPressed: () {
                                    cameraBloc.add(SetCameraTypeEvent(isVideo: true));
                                  },
                                  child: Text(
                                    'Video',
                                    style: textTheme.titleMedium!.copyWith(
                                      color:
                                          cameraState.isVideo ? AppColors.natural100 : AppColors.natural500,
                                      fontWeight: cameraState.isVideo ? FontWeight.w900 : FontWeight.normal,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    cameraBloc.add(SetCameraTypeEvent(isVideo: false));
                                  },
                                  child: Text(
                                    'Image',
                                    style: textTheme.titleMedium!.copyWith(
                                      color:
                                          !cameraState.isVideo ? AppColors.natural100 : AppColors.natural500,
                                      fontWeight: !cameraState.isVideo ? FontWeight.w900 : FontWeight.normal,
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
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
