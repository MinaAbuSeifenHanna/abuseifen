import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypelify_v2/Core/Extentions/center_ext.dart';
import 'package:hypelify_v2/Core/Routes/app_navigation.dart';
import 'package:hypelify_v2/Core/Routes/app_routes.dart';
import 'package:photo_manager/photo_manager.dart';
import '../../../../Core/Helpers/methods.dart';
import '../../../../Core/Themes/app_colors.dart';
import '../../../../Core/Widget/app_appBar.dart';
import '../Logic/Bloc/upload_long_videos_bloc.dart';

class UploadLongVideoScreen extends StatelessWidget {
  const UploadLongVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    // UploadLongVideosBloc uploadLongVideosBloc =
    //     context.read<UploadLongVideosBloc>();
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<UploadLongVideosBloc, UploadLongVideosState>(
          builder: (context, state) => (state
                  is UploadLongVideoGalleryLoadingState)
              ? const Center(child: CircularProgressIndicator())
              : (state is UploadLongVideoGalleryLoadedState)
                  ? Column(
                      children: [
                        GenralAppbar(
                          title: 'Upload video',
                          onPressed: () => Navigator.pop(context),
                          xIconNotBack: true,
                        ),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                              childAspectRatio: 0.6,
                            ),
                            itemCount: state.media.length,
                            itemBuilder: (context, index) {
                              final asset = state.media[index];
                              return FutureBuilder<Uint8List?>(
                                future: asset.thumbnailDataWithOption(
                                  const ThumbnailOption(
                                    size: ThumbnailSize(
                                      640, // Set width for high quality
                                      640, // Set height for high quality
                                    ),
                                    quality:
                                        100, // Set quality (0-100) for high quality
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (snapshot.hasData) {
                                      String duration = '';
                                      if (asset.type == AssetType.video) {
                                        duration = formatDuration(
                                            Duration(seconds: asset.duration));
                                      }
                                      return GestureDetector(
                                        onTap: () async {
                                          File? video = await asset.originFile;
                                          if (video != null) {
                                            AppNavigation.pushNamed(
                                              AppRoutes
                                                  .trimVideosScreenOfuUploadLongVideo,
                                              arguments: {
                                                'duration': asset.duration,
                                                'video': video,
                                              },
                                            );
                                          }
                                        },
                                        child: Stack(
                                          children: [
                                            Positioned.fill(
                                              child: DecoratedBox(
                                                decoration: const BoxDecoration(
                                                  color: AppColors.natural700,
                                                ),
                                                child: Image.memory(
                                                  snapshot.data!,
                                                  fit: BoxFit.contain,
                                                  errorBuilder:
                                                      (context, _, __) =>
                                                          const Icon(
                                                    Icons.error_outline,
                                                    color: AppColors.natural100,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            PositionedDirectional(
                                              end: 1,
                                              bottom: 0,
                                              child: Text(
                                                duration,
                                                style: textTheme.labelSmall!
                                                    .copyWith(
                                                        color: AppColors
                                                            .natural100),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                  }
                                  return const CircularProgressIndicator()
                                      .setCenter();
                                },
                              );
                            },
                          ),
                        )
                      ],
                    )
                  : const Center(child: Text('Unexpected error')),
        ),
      ),
    );
  }
}
