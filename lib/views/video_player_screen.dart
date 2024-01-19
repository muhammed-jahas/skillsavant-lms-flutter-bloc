import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late CustomVideoPlayerController _customVideoPlayerController;
  Uri videoUrl = Uri.parse('https://skillsavant.s3.amazonaws.com/module_videos/chess_intro.mp4');
  String assetVideoPath = '';
  @override
  void initState() {
    super.initState();
    initializeVideoplayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomVideoPlayer(customVideoPlayerController: _customVideoPlayerController) ,
    );
  }

  void initializeVideoplayer() {
    VideoPlayerController _videoPlayerController;
    _videoPlayerController = VideoPlayerController.networkUrl(videoUrl)
      ..initialize().then((value) {
        setState(() {
          
        });
      });

    _customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: _videoPlayerController);
  }
}
