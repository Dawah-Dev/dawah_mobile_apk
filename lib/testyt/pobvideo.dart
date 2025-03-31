import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class YouTubePlayerScreen extends StatefulWidget {
  @override
  _YouTubePlayerScreenState createState() => _YouTubePlayerScreenState();
}

class _YouTubePlayerScreenState extends State<YouTubePlayerScreen> {
  late PodPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube('https://www.youtube.com/watch?v=xMDD0O8UuYU'), // Replace with your YouTube link
    )..initialise();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pod Player - Custom Controls")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: PodVideoPlayer(controller: _controller),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.replay_10, size: 30),
                  onPressed: () => _controller.videoSeekTo(
                      _controller.currentVideoPosition - Duration(seconds: 10)),
                ),
                IconButton(
                  icon: Icon(_controller.isVideoPlaying
                      ? Icons.pause
                      : Icons.play_arrow, size: 30),
                  onPressed: () => _controller.togglePlayPause(),
                ),
                IconButton(
                  icon: Icon(Icons.forward_10, size: 30),
                  onPressed: () => _controller.videoSeekTo(
                      _controller.currentVideoPosition + Duration(seconds: 10)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: YouTubePlayerScreen()));
}
