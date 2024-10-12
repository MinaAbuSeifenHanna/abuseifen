import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PostVideoCard extends StatefulWidget {
  final String vedioURL;
  const PostVideoCard({
    Key? key,
    required this.vedioURL,
  }) : super(key: key);

  @override
  State<PostVideoCard> createState() => _PostVideoCardState();
}

class _PostVideoCardState extends State<PostVideoCard> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    if (!_isVideoInitialized) {
      initializePlayer();
    }
  }

  Future<void> initializePlayer() async {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.vedioURL));

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
    _chewieController?.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return _isVideoInitialized
        ? GestureDetector(
            onTap: () {
              if (_chewieController != null) {
                if (_chewieController!.isPlaying) {
                  _chewieController!.pause();
                } else {
                  _chewieController!.play();
                }
              }
            },
            child: AspectRatio(
              aspectRatio:
                  screenWidth / screenHeight, // Full-screen aspect ratio
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
          );
  }
}
