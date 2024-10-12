import 'package:flutter/material.dart';
import 'package:hypelify_v2/Features/Post/Presentation/Widget/post_widgets/types_of_posts/restricted_post.dart';

import '../../../../Domain/Entities/post_entity.dart';
import 'opened_post.dart';

class PostWidget extends StatefulWidget {
  final bool isBlocked;
  final PostDataEntity postDataEntity;

  const PostWidget({
    super.key,
    this.isBlocked = false,
    required this.postDataEntity,
  });

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width,
      child: widget.isBlocked
          ? const RestrictedPost()
          : OpenedPost(
              postDataEntity: widget.postDataEntity,
            ),
    );
  }
}
