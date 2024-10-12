// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:hypelify_v2/Features/Reels/Presentation/Widget/option_screen.dart';

class ReelsContent extends StatefulWidget {
  final String src;
  final String caption;
  final String audience;
  final String like;
  final String comment;
  final String share;
  final String name;
  final String image;

  const ReelsContent({
    super.key,
    required this.src,
    required this.caption,
    required this.audience,
    required this.like,
    required this.comment,
    required this.share,
    required this.name,
    required this.image,
  });

  @override
  State<ReelsContent> createState() => _ReelsContentState();
}

class _ReelsContentState extends State<ReelsContent> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.src));

    try {
      await _videoPlayerController.initialize();
      _isVideoInitialized = true;

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        showControls: false,
        looping: true,
      );

      setState(() {});
    } catch (e) {
      // Handle errors, such as network issues
      debugPrint('Error initializing video: $e');
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        _isVideoInitialized
            ? GestureDetector(
                onTap: () {
                  if (_chewieController != null) {
                    if (_chewieController!.isPlaying) {
                      print('Double tap ${_chewieController!.isPlaying}');
                      _chewieController!.pause();
                    } else {
                      print('Double tap ${_chewieController!.isPlaying}');
                      _chewieController!.play();
                    }
                  }
                },
                child: AspectRatio(
                  aspectRatio: screenWidth / screenHeight, // Full-screen aspect ratio
                  child: Chewie(
                    controller: _chewieController!,
                  ),
                ),
              )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('Loading...'),
                ],
              ),
        ReelsOption(
          caption: widget.caption,
          audience: widget.audience,
          comment: widget.comment,
          like: widget.like,
          share: widget.share,
          name: widget.name,
          image: widget.image,
        ),
      ],
    );
  }
}
