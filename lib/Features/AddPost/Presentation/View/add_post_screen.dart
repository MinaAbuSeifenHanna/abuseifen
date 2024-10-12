import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hypelify_v2/Core/Constants/asset_strings.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Routes/app_navigation.dart';
import 'package:hypelify_v2/Core/Routes/app_routes.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';
import 'package:hypelify_v2/Core/Widget/app_appBar.dart';
import 'package:hypelify_v2/Features/AddPost/Presentation/Bloc/add_post_bloc.dart';
import 'package:hypelify_v2/Features/AddPost/Presentation/Widget/share_new_post.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../Core/Helpers/methods.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});

  final transformationController = TransformationController();
  final Map<int, Future<Uint8List?>> _imageCache = {};

  @override
  Widget build(BuildContext context) {
    AddPostBloc addPostBloc = context.read();
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AddPostBloc, AddPostState>(
          builder: (context, state) {
            print("state is $state");
            return (state is PostGalleryLoadingState)
                ? const Center(child: CircularProgressIndicator())
                : (state is PostGalleryLoadedState)
                    ? Column(
                        children: [
                          GenralAppbar(
                            title: 'New post',
                            onPressed: () => Navigator.pop(context),
                            xIconNotBack: true,
                            isHaveAction: true,
                            action: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: AppColors.primary500, borderRadius: BorderRadius.circular(25)),
                              child: TextButton(
                                //statesController: state.selectedItems.entries.first.value[0],
                                onPressed: () async {
                                  List<File> files = [];
                                  EasyLoading.show();
                                  await Future.wait(
                                    state.selectedItems.entries.map((entry) async {
                                      File? f = await (entry.value[1] as AssetEntity).originFile;
                                      if (f != null) {
                                        files.add(f);
                                      }
                                    }),
                                  );
                                  EasyLoading.dismiss();
                                  AppNavigation.push(
                                    MaterialPageRoute(
                                      builder: (_) => BlocProvider.value(
                                        value: addPostBloc,
                                        child: ShareNewPost(
                                          file: files,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Next',
                                  style: textTheme.labelMedium,
                                ),
                              ),
                            ).setHorizontalAndVerticalPadding(context, 5, 5, enableMediaQuery: false),
                          ),
                          SizedBox(
                            width: size.width,
                            height: size.height * 0.35,
                            child: InteractiveViewer(
                              transformationController: transformationController,
                              // pass the transformation controller
                              onInteractionEnd: (details) {},
                              boundaryMargin: const EdgeInsets.all(20.0),
                              scaleEnabled:
                                  (state.selectedItems.entries.first.value.last as AssetEntity).type ==
                                          AssetType.video
                                      ? false
                                      : true,
                              panEnabled: true,
                              minScale: 1,
                              maxScale: 4,
                              child: Image.memory(
                                state.selectedItems.entries.first.value[0],
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          ),
                          DecoratedBox(
                            decoration: const BoxDecoration(color: AppColors.natural600),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: AppColors.natural500,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: GestureDetector(
                                    onTap: () => addPostBloc.add(ToggleIsMultiSelector()),
                                    child: Image.asset(
                                      IconStrings.copy,
                                      color: AppColors.natural100,
                                    ).setHorizontalAndVerticalPadding(context, 5, 5, enableMediaQuery: false),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: AppColors.natural500,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: GestureDetector(
                                    onTap: () async {
                                      File? file = await AppNavigation.pushNamed(
                                        AppRoutes.cameraView,
                                      );
                                      if (file != null) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return BlocProvider<AddPostBloc>.value(
                                                value: addPostBloc,
                                                child: ShareNewPost(
                                                  file: [file],
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      }
                                    },
                                    child: Image.asset(
                                      IconStrings.camera,
                                      color: AppColors.natural100,
                                    ).setHorizontalAndVerticalPadding(context, 5, 5, enableMediaQuery: false),
                                  ),
                                ),
                              ],
                            ).setHorizontalAndVerticalPadding(context, 10, 5, enableMediaQuery: false),
                          ),
                          Expanded(
                            child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 0.6,
                              ),
                              itemCount: state.media.length,
                              itemBuilder: (context, index) {
                                final asset = state.media[index];
                                final isSelected = state.selectedItems.containsKey(index);

                                // Check if the image for the current index is already cached
                                if (!_imageCache.containsKey(index)) {
                                  // Cache the future if not present
                                  _imageCache[index] = asset.thumbnailDataWithOption(
                                    const ThumbnailOption(
                                      size: ThumbnailSize(640, 640),
                                      quality: 100,
                                    ),
                                  );
                                }

                                return FutureBuilder<Uint8List?>(
                                  future: _imageCache[index],
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.done) {
                                      if (snapshot.hasData) {
                                        String duration = '';
                                        if (asset.type == AssetType.video) {
                                          duration = formatDuration(Duration(seconds: asset.duration));
                                        }
                                        return GestureDetector(
                                          onTap: () {
                                            addPostBloc.add(
                                                PostAddSelectedItemsEvent(index, [snapshot.data!, asset]));
                                          },
                                          child: Stack(
                                            children: [
                                              Positioned.fill(
                                                child: DecoratedBox(
                                                  decoration:
                                                      const BoxDecoration(color: AppColors.natural700),
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
                                              if (state.selectedItems.containsKey(index))
                                                Positioned.fill(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: AppColors.natural100.withOpacity(0.7),
                                                    ),
                                                  ),
                                                ),
                                              if (state.isMultiSelector)
                                                PositionedDirectional(
                                                  top: 5,
                                                  start: 5,
                                                  child: Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColors.scaffoldBackgroundColor.withOpacity(0.5),
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
                                              PositionedDirectional(
                                                end: 1,
                                                bottom: 0,
                                                child: Text(
                                                  duration,
                                                  style: textTheme.labelSmall!
                                                      .copyWith(color: AppColors.natural100),
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
                          )
                        ],
                      )
                    : (state is PostGalleryErrorState)
                        ? Center(
                            child: Text(state.message),
                          )
                        : const Center(
                            child: Text('Unexpected error'),
                          );
          },
        ),
      ),
    );
  }
}