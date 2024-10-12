import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypelify_v2/Core/Constants/asset_strings.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';
import 'package:hypelify_v2/Core/Widget/main_app_button.dart';
import 'package:video_trimmer/video_trimmer.dart';

import '../Logic/TrimCubit/trim_video_cubit.dart';

class TrimVideosScreen extends StatefulWidget {
  final int duration;
  final File video;

  const TrimVideosScreen({
    super.key,
    required this.duration,
    required this.video,
  });

  @override
  State<TrimVideosScreen> createState() => _TrimVideosScreenState();
}

class _TrimVideosScreenState extends State<TrimVideosScreen> {
  late TrimVideoCubit _trimVideoCubit;

  //Trimmer trimmer = Trimmer();

  @override
  void initState() {
    super.initState();
    _trimVideoCubit = TrimVideoCubit();
    //trimmer.loadVideo(videoFile: widget.video).then((v) => setState(() {}));
  }

  @override
  void deactivate() {
    super.deactivate();
    _trimVideoCubit.close(); // Close Cubit if it's not managed by BlocProvider
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: BlocProvider<TrimVideoCubit>(
          create: (context) => _trimVideoCubit..loadVideo(widget.video),
          child: Column(
            children: [
              Expanded(
                child: BlocConsumer<TrimVideoCubit, TrimVideoState>(
                  listener: (context, state) {
                    if (state is TrimVideoError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: ${state.message}')),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is TrimVideoLoaded) {
                      return Stack(
                        children: [
                          Positioned.fill(
                            child: GestureDetector(
                              onTap: () {
                                /*if(state.trimmer.videoPlayerController?.value.isPlaying??false) {
                          state.trimmer.videoPlayerController?.pause();
                        }
                        state.trimmer.videoPlayerController?.play();*/
                              },
                              child: VideoViewer(
                                trimmer: state.trimmer,
                                borderColor: AppColors.natural100,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: SafeArea(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 88,
                                    height: 40,
                                    child: MainAppButton(
                                      bgColor: AppColors.primary500,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          'Cancel',
                                          style: textTheme.titleMedium,
                                        ),
                                      ),
                                      onTap: () => Navigator.pop(context),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 88,
                                    height: 40,
                                    child: MainAppButton(
                                      bgColor: AppColors.primary500,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          'Next',
                                          style: textTheme.titleMedium,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ).setHorizontalPadding(context, 0.03),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: IconButton(
                              onPressed: () {},
                              icon: Image.asset(IconStrings.music),
                            ),
                          ),
                        ],
                      );
                    } else if (state is TrimVideoLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Center(child: Text('Unexpected error ${state}'));
                  },
                ),
              ),
              TrimViewer(
                trimmer: _trimVideoCubit.trimmer,
                viewerWidth: size.width * 0.9,
                maxVideoLength: Duration(seconds: widget.duration),
                onChangeStart: (value){},
                onChangeEnd: (value){},
                onChangePlaybackState: (value){},
                durationStyle: DurationStyle.FORMAT_MM_SS,
                type: ViewerType.fixed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
