import 'package:flutter/material.dart';

import '../../../../Core/Constants/asset_strings.dart';
import '../../../../Core/Themes/app_colors.dart';

class ProfileImageBuilder extends StatelessWidget {
  final Size screenSize;
  final double coverHeight;
  final String profileImage;
  final bool isEdit;

  const ProfileImageBuilder({
    super.key,
    required this.screenSize,
    required this.coverHeight,
    required this.profileImage,
    required this.isEdit,
  });

  @override
  Widget build(BuildContext context) {
    return isEdit == false
        ? SizedBox(
            width: screenSize.width,
            height: coverHeight + 55,
            child: Stack(
              children: [
                // The Cover
                Image(
                  image: const ExactAssetImage(ImageStrings.profileCover),
                  height: coverHeight,
                  width: screenSize.width,
                  filterQuality: FilterQuality.low,
                  fit: BoxFit.cover,
                ),
                //Profile Image
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage(profileImage),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          width: 3,
                          color: AppColors.natural300,
                        ),
                        shape: BoxShape.circle),
                  ),
                ),
              ],
            ),
          )
        : Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(profileImage),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    width: 3,
                    color: AppColors.natural300,
                  ),
                  shape: BoxShape.circle),
            ),
          );
  }
}
