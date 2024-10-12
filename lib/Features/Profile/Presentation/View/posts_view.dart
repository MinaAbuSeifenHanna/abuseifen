import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Constants/asset_strings.dart';

class PostsView extends StatelessWidget {
  PostsView({super.key});

  final images = [
    ImageStrings.postImage2,
    ImageStrings.postImage2,
    ImageStrings.postImage2,
    ImageStrings.postImage2,
    ImageStrings.postImage2,
    ImageStrings.postImage2,
    ImageStrings.postImage2,
    ImageStrings.postImage2,
    ImageStrings.postImage2,
    ImageStrings.postImage2,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      crossAxisSpacing: 5,
      mainAxisSpacing: 1.5,
      childAspectRatio: 1,
      children: images.map((imagePath) {
        return Image.asset(
          imagePath,
          fit: BoxFit.cover,
        );
      }).toList(),
    );
  }
}
