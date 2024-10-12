// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/Extentions/extentions.dart';
import '../../../../../Core/Themes/app_colors.dart';
import '../../bloc/Like Bloc/bloc/post_like_bloc.dart';

class PostLikesWidget extends StatelessWidget {
  final int postID;
  const PostLikesWidget({
    Key? key,
    required this.postID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostLikeBloc>(
      create: (_) => PostLikeBloc()..add(GetPostLikeData(postID: postID)),
      child: BlocBuilder<PostLikeBloc, PostLikeState>(
        builder: (context, state) {
          if (state is HavePostLikeState) {
            return state.likeEntity.isEmpty
                ? const SizedBox()
                : Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        const Center(
                          child: Text(
                            'Likes',
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

                              itemCount: state.likeEntity.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(
                                          state.likeEntity[index].user!.image!),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                state.likeEntity[index].user!
                                                    .userName!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                              const SizedBox(width: 4),
                                              const Icon(Icons.check_circle,
                                                  color: Colors.blue, size: 16),
                                              // const SizedBox(width: 4),
                                              // Text(
                                              //   state
                                              //       .likeEntity[index].createdAt!,
                                              //   style: Theme.of(context)
                                              //       .textTheme
                                              //       .bodySmall!
                                              //       .copyWith(
                                              //           color:
                                              //               AppColors.natural200),
                                              // ),
                                            ],
                                          ),
                                          Text(
                                            state.likeEntity[index].user!.name!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    color:
                                                        AppColors.natural200),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 2,
                                            horizontal: 10,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          )),
                                      onPressed: () {},
                                      child: const Text(
                                        'Follow',
                                        style: TextStyle(
                                          color: AppColors.natural100,
                                        ),
                                      ),
                                    )
                                  ],
                                ).setHorizontalPadding(context, 0.02);
                              }),
                        ),
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
