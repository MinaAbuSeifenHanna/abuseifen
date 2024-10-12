import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';
import 'package:hypelify_v2/Core/Widget/app_appBar.dart';
import 'package:hypelify_v2/Core/Widget/main_app_button.dart';
import 'package:hypelify_v2/Features/AddReels/Presentation/Bloc/add_reels_bloc.dart';
import 'package:hypelify_v2/Features/AddReels/Presentation/Widgets/video_player_screen.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../Core/Routes/app_navigation.dart';
import '../Widgets/share_new_reel.dart';

class SelectedMediaScreen extends StatelessWidget {
  const SelectedMediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddReelsBloc addReelsBloc = context.read();
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AddReelsBloc, AddReelsState>(
          builder: (context, state) {
            if (state is GalleryLoadedState) {
              return Column(
                children: [
                  GenralAppbar(
                    title: '',
                    onPressed: () => Navigator.pop(context),
                  ).setHorizontalPadding(context, 0.03),
                  Expanded(
                    child: PageView(
                      children: state.selectedItems.entries.map((e) {
                        AssetEntity asset = (e.value.last as AssetEntity);
                        if (asset.type == AssetType.image) {
                          return Image.memory(
                            e.value.first,
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.fitWidth,
                          );
                        }
                        return FutureBuilder<File?>(
                          future: asset.originFile,
                          builder: (context, AsyncSnapshot<File?> snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              if (snapshot.hasData) {
                                return VideoPlayerScreen(videoFile: snapshot.data!);
                              }
                            }
                            return const SizedBox();
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: SizedBox(
                      width: size.width * 0.25,
                      child: MainAppButton(
                        bgColor: AppColors.primary500,
                        onTap: () => AppNavigation.push(
                          MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                              value: addReelsBloc,
                              child: ShareNewReel(),
                            ),
                          ),
                        ),
                        child: const Text('Next'),
                      ),
                    ).setHorizontalAndVerticalPadding(context, 0.01, 0.01),
                  )
                ],
              );
            }
            return const SizedBox(
              child: Text("No selected items"),
            );
          },
        ),
      ),
    );
  }
}
