// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ReelsOption extends StatelessWidget {
  final String name;
  final String image;
  final String caption;
  final String audience;
  final String like;
  final String comment;
  final String share;
  const ReelsOption({
    Key? key,
    required this.name,
    required this.image,
    required this.caption,
    required this.audience,
    required this.like,
    required this.comment,
    required this.share,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 110),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(image),
                        // child: Padding(
                        //   padding: const EdgeInsets.all(2.0),
                        //   child: Center(child: Image.network(image)),
                        // ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        name,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.verified,
                        size: 15,
                        color: Colors.white,
                      ),
                      // SizedBox(width: 6),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: Text(
                      //     'Follow',
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(width: 6),
                  Text(caption),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.music_note,
                        size: 15,
                        color: Colors.white,
                      ),
                      Text(audience),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                  ),
                  Text(like),
                  const SizedBox(height: 20),
                  const Icon(
                    Icons.comment_rounded,
                    color: Colors.white,
                  ),
                  Text(comment),
                  const SizedBox(height: 20),
                  Transform(
                    transform: Matrix4.rotationZ(5.8),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
