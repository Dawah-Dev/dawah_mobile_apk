import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  VideoPlayerScreen({required this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isPlaying = true;
  double _currentPosition = 0.0;
  double _totalDuration = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..addListener(() {
        if (_controller.value.isInitialized) {
          setState(() {
            _currentPosition = _controller.value.position.inSeconds.toDouble();
            _totalDuration = _controller.value.duration.inSeconds.toDouble();
          });
        }
      });

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
    });
  }

  void _seekTo(double value) {
    final position = Duration(seconds: value.toInt());
    _controller.seekTo(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Player")),
      body: Column(
        children: [
          FutureBuilder<void>(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                );
              } else {
                return Center(child: AspectRatio(aspectRatio: 16/9,
                child: Image.network('https://img.youtube.com/vi/xMDD0O8UuYU/hqdefault.jpg',fit: BoxFit.cover,),
                ));
              }
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: _togglePlayPause,
              ),
              IconButton(
                icon: Icon(Icons.replay_10),
                onPressed: () {
                  final position = _controller.value.position - Duration(seconds: 10);
                  _controller.seekTo(position);
                },
              ),
              IconButton(
                icon: Icon(Icons.forward_10),
                onPressed: () {
                  final position = _controller.value.position + Duration(seconds: 10);
                  _controller.seekTo(position);
                },
              ),
            ],
          ),
          Slider(
            value: _currentPosition,
            min: 0.0,
            max: _totalDuration,
            onChanged: _seekTo,
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: VideoPlayerScreen(
      videoUrl: "https://r3---sn-qpbpjvocq-gwie.googlevideo.com/videoplayback?expire=1743329336&ei=2MPoZ4iEGNjQ6dsPh4u2UQ&ip=37.49.149.86&id=o-ANY71GteYMGjVIRcD3wdSCwj7sAtBGYDticHDPuINHsY&itag=18&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&rms=au%2Cau&bui=AccgBcNAYmQhah1utqA5zOjwhlkprnYhzY2Z7D4GEJPp5DzGbjehB_c-OWcDp9j5VUw_IB5kD5nFDz1a&spc=_S3wKupSypm04LlTz2xZ-VcZ5rVmUMe_yxmJpgJym-xxSP_IMbg9&vprv=1&svpuc=1&mime=video%2Fmp4&ns=uoiCjfX4FGsxmeBj3fhyZ04Q&rqh=1&gir=yes&clen=5117014&ratebypass=yes&dur=109.017&lmt=1742153381768892&fexp=51355912%2C51435733&c=WEB&sefc=1&txp=4438534&n=R_952ROxQvJ5EA&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cbui%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cns%2Crqh%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AJfQdSswRQIgUbqEGYpDLw34tYX6XhWHUi0g2adFbYGKykyA-VnLskcCIQCzDLSmeXztcGmtHuoStWMWuUryFSfKvzwCWM4Zg51m6A%3D%3D&pot=MpgB8IqYPxurZybwtuMM-PWcI0zi7NdOK5wbTp5QnHG4ruRYrW7pbophQpgLLPhzb1p_W_O6u3GZzUY4rwya92Um99Sav_rVmDhBKHmIFFsyRq9ATLOKUUHPAQ1ebDYydm3znhFnMwbRW926JxPKGc7whMjIK4biENbp2cSXYz6ei2Xm8asPAxBU7Lb7H7fX3PzK531_gm0zfTA=&cms_redirect=yes&met=1743307738,&mh=Fn&mip=103.157.95.81&mm=31&mn=sn-qpbpjvocq-gwie&ms=au&mt=1743307263&mv=m&mvi=3&pl=24&lsparams=met,mh,mip,mm,mn,ms,mv,mvi,pl,rms&lsig=AFVRHeAwRAIgVqvuTqoeEJ2z6z86RuMY4dXjr42sBg0VHgv-llVjtZwCIEEktf9vrVXMNeAUSuM4vMB29oiI-bfVMgljqjjmw0Ko",    ),
  ));
}
