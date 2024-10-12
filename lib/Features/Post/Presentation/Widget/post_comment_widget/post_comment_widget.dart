// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/Extentions/extentions.dart';
import '../../../../../Core/Constants/asset_strings.dart';
import '../../../../../Core/Themes/app_colors.dart';
import '../../bloc/Comment Bloc/bloc/post_comment_bloc.dart';

class PostCommentWidget extends StatelessWidget {
  final int postID;
  const PostCommentWidget({
    Key? key,
    required this.postID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostCommentBloc>(
      create: (_) => PostCommentBloc()..add(GetPostCommentData(postID: postID)),
      child: BlocBuilder<PostCommentBloc, PostCommentState>(
        builder: (context, state) {
          if (state is HavePostCommentState) {
            return state.commentEntity.isEmpty
                ? const SizedBox()
                : Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        const Center(
                          child: Text(
                            'Comment',
                            style: TextStyle(
                              color: AppColors.natural100,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ListView.builder(
                              // controller: scrollController,

                              itemCount: state.commentEntity.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(state
                                          .commentEntity[index].user!.image!),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              state.commentEntity[index].user!
                                                  .userName!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                            const SizedBox(width: 4),
                                            const Icon(Icons.check_circle,
                                                color: Colors.blue, size: 16),
                                            const SizedBox(width: 4),
                                            Text(
                                              state.commentEntity[index]
                                                  .createdAt!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      color:
                                                          AppColors.natural200),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          state.commentEntity[index].comment!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                  color: AppColors.natural200),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(IconStrings.love),
                                    ),
                                  ],
                                ).setHorizontalPadding(context, 0.02);
                              }),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'write you comment',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 1.0,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(IconStrings.share),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
          } else {
            return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('Loading...'),
                ]);
          }
        },
      ),
    );
  }
}
