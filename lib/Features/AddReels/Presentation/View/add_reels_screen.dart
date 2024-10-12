import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypelify_v2/Core/Constants/asset_strings.dart';
import 'package:hypelify_v2/Core/Helpers/helpers.dart';
import 'package:hypelify_v2/Core/Routes/routes.dart';
import 'package:hypelify_v2/Core/Widget/app_appBar.dart';
import 'package:hypelify_v2/Core/Widget/main_app_button.dart';
import 'package:hypelify_v2/Features/AddReels/Presentation/Bloc/CameraBloc/reels_camera_bloc.dart';
import 'package:hypelify_v2/Features/AddReels/Presentation/View/reels_camera_view.dart';
import 'package:hypelify_v2/Features/AddReels/Presentation/View/selected_media_screen.dart';
import 'package:hypelify_v2/Features/AddReels/Presentation/Widgets/video_player_screen.dart';
import 'package:photo_manager/photo_manager.dart';
import '../../../../Core/Constants/other_constants.dart';
import '../../../../Core/Helpers/methods.dart';
import '../Bloc/add_reels_bloc.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';
import 'package:hypelify_v2/Features/AdDetails/Presentation/Widgets/ad_card.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';

class AddReelsScreen extends StatelessWidget {
  const AddReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddReelsBloc addReelsBloc = context.read();
    return Scaffold(
      body: BlocBuilder<AddReelsBloc, AddReelsState>(
        builder: (context, state) {
          if (state is GalleryLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GalleryLoadedState) {
            var size = MediaQuery.sizeOf(context);
            var theme = Theme.of(context).textTheme;
            return Column(
              children: [
                GenralAppbar(
                  title: '',
                  xIconNotBack: true,
                  onPressed: () => Navigator.pop(context),
                ).setHorizontalPadding(context, 0.03),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AdCard(
                        children: [
                          Image.asset(
                            IconStrings.camera_in_add_story,
                            color: AppColors.natural100,
                          ).setCenter(),
                          Text(
                            'Camera',
                            style: theme.labelMedium,
                          ).setCenter(),
                        ],
                        /*onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BlocProvider<AddReelsBloc>.value(
                              value: addReelsBloc,
                              child: const ReelsCameraView(),
                            ),
                          ),
                        ),*/
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MultiBlocProvider(
                              providers: [
                                BlocProvider.value(
                                  value: addReelsBloc,
                                ),
                                BlocProvider(
                                  create: (context) => DependencyInjectionHelper().sl<ReelsCameraBloc>(),
                                ),
                              ],
                              child: const ReelsCameraView(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.sp),
                    Expanded(
                      child: AdCard(
                        children: [
                          Image.asset(
                            IconStrings.draft,
                            color: AppColors.natural100,
                          ).setCenter(),
                          Text(
                            'Draft',
                            style: theme.labelMedium,
                          ).setCenter(),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.sp),
                    Expanded(
                      child: AdCard(
                        children: [
                          Image.asset(
                            IconStrings.gif,
                            color: AppColors.natural100,
                          ).setCenter(),
                          Text(
                            'Clip hub',
                            style: theme.labelMedium,
                          ).setCenter(),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.sp),
                    Expanded(
                      child: AdCard(
                        children: [
                          Image.asset(
                            IconStrings.template,
                            color: AppColors.natural100,
                          ).setCenter(),
                          Text(
                            'Template',
                            style: theme.labelMedium,
                          ).setCenter(),
                        ],
                      ),
                    ),
                  ],
                ).setHorizontalPadding(context, 0.03),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                            childAspectRatio: 0.6,
                          ),
                          itemCount: state.media.length,
                          itemBuilder: (context, index) {
                            final asset = state.media[index];
                            final isSelected = state.selectedItems.containsKey(index);
                            return FutureBuilder<Uint8List?>(
                              future: asset.thumbnailDataWithOption(
                                const ThumbnailOption(
                                  size: ThumbnailSize(
                                    640, // Set width for high quality
                                    640, // Set height for high quality
                                  ),
                                  quality: 100, // Set quality (0-100) for high quality
                                ),
                              ),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.done) {
                                  if (snapshot.hasData) {
                                    String duration = '';
                                    if (asset.type == AssetType.video) {
                                      duration = formatDuration(Duration(seconds: asset.duration));
                                    }
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MediaPreviewScreen(asset: asset),
                                          ),
                                        );
                                      },
                                      child: Stack(
                                        children: [
                                          Positioned.fill(
                                            child: DecoratedBox(
                                              decoration: const BoxDecoration(
                                                color: AppColors.natural700,
                                              ),
                                              //TODO check if video show frame from it
                                              child: Image.memory(
                                                snapshot.data!,
                                                fit: BoxFit.contain,
                                                errorBuilder: (context, _, __) => const Icon(
                                                  Icons.error_outline,
                                                  color: AppColors.natural100,
                                                ),
                                              ),
                                            ),
                                          ),
                                          PositionedDirectional(
                                            top: 5,
                                            start: 5,
                                            child: GestureDetector(
                                              onTap: () {
                                                // Handle selection of the item
                                                context.read<AddReelsBloc>().add(
                                                      AddSelectedItemsEvent(
                                                        index,
                                                        [snapshot.data!, asset],
                                                      ),
                                                    );
                                                //addReelsBloc.add(AddSelectedItemsEvent(index));
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  color: AppColors.scaffoldBackgroundColor.withOpacity(0.5),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: AppColors.natural100,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: isSelected
                                                    ? const Icon(
                                                        Icons.check,
                                                        color: AppColors.natural100,
                                                        size: 20,
                                                      )
                                                    : null,
                                              ),
                                            ),
                                          ),
                                          PositionedDirectional(
                                            end: 1,
                                            bottom: 0,
                                            child: Text(
                                              duration,
                                              style: theme.labelSmall!.copyWith(color: AppColors.natural100),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                }
                                return const CircularProgressIndicator().setCenter();
                              },
                            );
                          },
                        ),
                      ),
                      if (state.selectedItems.isNotEmpty)
                        Container(
                          width: size.width,
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32.sp),
                              topRight: Radius.circular(32.sp),
                            ),
                            gradient: OtherConstants.appLinearGradient,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: state.selectedItems.entries
                                        .map((e) => SizedBox(
                                              height: 40,
                                              width: 30,
                                              child: Image.memory(
                                                e.value.first,
                                                fit: BoxFit.contain,
                                              ),
                                            ).setHorizontalPadding(context, 0.01))
                                        .toList(),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: MainAppButton(
                                  bgColor: AppColors.primary500,
                                  child: const Text('Next'),
                                  onTap: () => AppNavigation.push(
                                    MaterialPageRoute(
                                      builder: (_) => BlocProvider.value(
                                        value: addReelsBloc,
                                        child: const SelectedMediaScreen(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                )
              ],
            );
          } else if (state is GalleryErrorState) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Unexpected error'));
        },
      ),
    );
  }
}

class MediaPreviewScreen extends StatelessWidget {
  final AssetEntity asset;

  const MediaPreviewScreen({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<File?>(
          future: asset.file,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return asset.type == AssetType.video
                    ? VideoPlayerScreen(
                        videoFile: snapshot.data!,
                      )
                    : Image.file(
                        snapshot.data!,
                        fit: BoxFit.cover,
                      );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
