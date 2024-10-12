// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../../Core/Themes/app_colors.dart';
// import '../../bloc/Like Bloc/bloc/post_like_bloc.dart';
// import '../post_likes_widget/likes_bottom_sheet.dart';
//
// class PostLikesBar extends StatelessWidget {
//   final int postID;
//   const PostLikesBar({
//     Key? key,
//     required this.postID,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<PostLikeBloc>(
//       create: (context) => PostLikeBloc()..add(GetPostLikeData(postID: postID)),
//       child: BlocBuilder<PostLikeBloc, PostLikeState>(
//         builder: (context, state) {
//           if (state is HavePostLikeState) {
//             return Row(
//               children: [
//                 CircleAvatar(
//                   radius: 14,
//                   backgroundImage:
//                       NetworkImage(state.likeEntity.first.user!.image!),
//                 ),
//                 const SizedBox(width: 6),
//                 GestureDetector(
//                   onTap: () {
//                     showModalBottomSheet(
//                         context: context,
//                         backgroundColor: AppColors.scaffoldBackgroundColor,
//                         isScrollControlled: false,
//                         shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(12),
//                           topRight: Radius.circular(12),
//                         )),
//                         builder: (ctx) {
//                           return PostLikesWidget(
//                             postID: postID,
//                           );
//                         });
//                   },
//                   child: RichText(
//                     text: TextSpan(
//                       style: const TextStyle(color: Colors.white),
//                       children: [
//                         const TextSpan(text: 'Liked by '),
//                         TextSpan(
//                           text: state.likeEntity.first.user!.userName!,
//                           style: const TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         TextSpan(
//                             text: (state.likeEntity.length - 1) == 0
//                                 ? ''
//                                 : ' and '),
//                         TextSpan(
//                           text: (state.likeEntity.length - 1) == 0
//                               ? ''
//                               : state.likeEntity.length.toString(),
//                           style: const TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           } else {
//             return const SizedBox();
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/Themes/app_colors.dart';
import '../../bloc/Like Bloc/bloc/post_like_bloc.dart';
import '../post_likes_widget/likes_bottom_sheet.dart';

class PostLikesBar extends StatelessWidget {
  final int postID;

  const PostLikesBar({
    Key? key,
    required this.postID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostLikeBloc>(
      create: (context) => PostLikeBloc()..add(GetPostLikeData(postID: postID)),
      child: BlocBuilder<PostLikeBloc, PostLikeState>(
        builder: (context, state) {
          if (state is HavePostLikeState && state.likeEntity.isNotEmpty) {
            return Row(
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundImage: NetworkImage(state.likeEntity.first.user!.image!),
                ),
                const SizedBox(width: 6),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: AppColors.scaffoldBackgroundColor,
                      isScrollControlled: false,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      builder: (ctx) {
                        return PostLikesWidget(postID: postID);
                      },
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        const TextSpan(text: 'Liked by '),
                        TextSpan(
                          text: state.likeEntity.first.user!.userName!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: (state.likeEntity.length - 1) == 0 ? '' : ' and ',
                        ),
                        TextSpan(
                          text: (state.likeEntity.length - 1) == 0
                              ? ''
                              : state.likeEntity.length.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
