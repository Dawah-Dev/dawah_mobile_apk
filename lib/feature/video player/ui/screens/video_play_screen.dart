import 'dart:async';

import 'package:dawah_mobile_application/feature/common/ui/widgets/video_card.dart';
import 'package:dawah_mobile_application/third_party_library/mini_player/miniplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayScreen extends StatefulWidget {
  final MiniplayerController miniplayerController;

  final double height;

  const VideoPlayScreen(
      {super.key, required this.height, required this.miniplayerController});

  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  late double displayWidth;

  final String videoUrl = "dLnrfYkQiwc";
  late YoutubePlayerController _controller;
  bool _isPlaying = false;
  Duration _currentPosition = Duration.zero;
  Duration _videoDuration = Duration.zero;
  bool _showControls = true;
  late Timer _hideControlsTimer;
  bool _isFullScreen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: videoUrl,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        hideControls: true, // Hide default controls
      ),
    )..addListener(_listener);

    // Set up the timer to hide controls after inactivity
    _hideControlsTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_isPlaying && _showControls) {
        setState(() {
          _showControls = false;
        });
      }
    });
  }

  void _listener() {
    if (_controller.value.isReady) {
      setState(() {
        _currentPosition = _controller.value.position;
        _videoDuration = _controller.value.metaData.duration;
      });
    }

    if (_controller.value.playerState == PlayerState.playing) {
      setState(() => _isPlaying = true);
    } else if (_controller.value.playerState == PlayerState.paused ||
        _controller.value.playerState == PlayerState.ended) {
      setState(() => _isPlaying = false);
    }
  }

  void _onTapPlayer() {
    setState(() {
      _showControls = true;
    });

    // Reset the timer every time the player is tapped
    _hideControlsTimer.cancel();
    _hideControlsTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_isPlaying && _showControls) {
        setState(() {
          _showControls = false;
        });
      }
    });
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });

    if (_isFullScreen) {
      // Lock the screen to landscape orientation
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    } else {
      // Lock the screen back to portrait orientation
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    displayWidth = MediaQuery.of(context).size.width;

    return Container(
      height: widget.height,
      width: displayWidth,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _onTapPlayer,
                child: SizedBox(
                  height: widget.height > displayWidth * (9 / 16)
                      ? _isFullScreen ? double.infinity : displayWidth * (9 / 16)
                      : widget.height - 4,
                  width: widget.height > 61
                      ? displayWidth
                      : (widget.height * (16 / 9)) - 6,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: buildYoutubePlayerandControllerButton(),
                  ),
                ),
              ),
              if (widget.height < 61) buildInfoAndButtonForMiniSize()
            ],
          ),
          if (widget.height < 61) buildVideoIndicatorForMiniLayout(),
          if (widget.height > displayWidth * (9 / 16))
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  color: Colors.transparent,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildVideoInfoAndActionButtonAndSubscribeSection(),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          child: Text(
                            'Recommend',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        buildRecommendVideoListView(),
                      ],
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }

  Column buildVideoInfoAndActionButtonAndSubscribeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            'তাকওয়া অবলম্বনের গুরুত্ব ও ফজিলত | Shaikh Tamim Al Adnani',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            'Emotional Nasheed | হে আমার মা! ',
            maxLines: 1,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 36,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 10),
            children: [
              SaveShareDownloadButton(
                title: 'Save',
                icon: CupertinoIcons.bookmark_solid,
              ),
              SaveShareDownloadButton(
                title: 'Share',
                icon: Icons.share,
              ),
              SaveShareDownloadButton(
                title: 'Audio download',
                icon: Icons.multitrack_audio_sharp,
              ),
              SaveShareDownloadButton(
                title: "Don't Interested",
                icon: Icons.videocam_off,
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Divider(
          color: Colors.blueGrey.shade50.withOpacity(0.5),
          height: 4,
        ),
        ListTile(
          leading: CircleAvatar(),
          title: Text('Ummah Network'),
          trailing: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              elevation: 0,
            ),
            child: Text(
              'Subscribe',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.blueGrey.shade50.withOpacity(0.5),
          height: 4,
        ),
      ],
    );
  }

  ListView buildRecommendVideoListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      itemBuilder: (context, index) {
        return VideoCard();
      },
    );
  }

  LinearProgressIndicator buildVideoIndicatorForMiniLayout() {
    return LinearProgressIndicator(
      value: _videoDuration.inSeconds > 0
          ? _currentPosition.inSeconds / _videoDuration.inSeconds
          : 0.0,
      minHeight: 4,
      color: Colors.blueAccent,
    );
  }

  Expanded buildInfoAndButtonForMiniSize() {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'তাকওয়া অবলম্বনের গুরুত্ব ও ফজিলত | Shaikh Tamim Al Adnani',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Ummah Network',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (_isPlaying) {
                      _controller.pause();  // Pause the video
                    } else {
                      _controller.play();   // Play the video
                    }
                    _isPlaying = !_isPlaying;  // Toggle the play state
                  });
                },
                icon: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow, // Change the icon based on play/pause state
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.close),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;  // Get the minutes (integer division)
    int remainingSeconds = seconds % 60;  // Get the remaining seconds
    // Return the formatted time in "minutes:seconds" format
    return '${minutes}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  Stack buildYoutubePlayerandControllerButton() {
    return Stack(
      children: [
        YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
            progressColors: const ProgressBarColors(
              playedColor: Colors.blueAccent,
              handleColor: Colors.blueAccent,
            ),
          ),builder: (context, player) {
          return Expanded(
            child: Column(
              children: [
                player,
              ],
            ),
          );
        },
        ),
        if (widget.height > 400)
          IconButton(
            onPressed: () {
              widget.miniplayerController
                  .animateToHeight(state: PanelState.MIN);
            },
            icon: Icon(
              Icons.arrow_drop_down_circle_rounded,
              color: Colors.white.withOpacity(0.5),
              size: 30,
            ),
          ),
        if (widget.height > 400 && _showControls)
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    final currentPosition = _controller.value.position;
                    final newPosition = currentPosition - Duration(seconds: 10);
                    if (newPosition >= Duration.zero) {
                      _controller.seekTo(newPosition);  // Rewind by 10 seconds
                    } else {
                      _controller.seekTo(Duration.zero);  // Avoid going below 0
                    }
                  },
                  icon: Icon(
                    Icons.replay_10,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(width: 24),
                IconButton(
                  onPressed: () {
                    widget.miniplayerController
                        .animateToHeight(state: PanelState.MIN);
                  },
                  icon: CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.black.withOpacity(0.4),
                    child:IconButton(
                      onPressed: () {
                        setState(() {
                          if (_isPlaying) {
                            _controller.pause();  // Pause the video
                          } else {
                            _controller.play();   // Play the video
                          }
                          _isPlaying = !_isPlaying;  // Toggle the play state
                        });
                      },
                      icon: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow, // Change the icon based on play/pause state
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 24),
                IconButton(
                  onPressed: () {
                    final currentPosition = _controller.value.position;
                    final newPosition = currentPosition + Duration(seconds: 10);
                    final videoDuration = _controller.value.metaData.duration;

                    if (newPosition <= videoDuration) {
                      _controller.seekTo(newPosition);  // Skip forward by 10 seconds
                    } else {
                      _controller.seekTo(videoDuration);  // Avoid going beyond the video's end
                    }
                  },
                  icon: Icon(
                    Icons.forward_10,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        if (widget.height > 400 && _showControls)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: 40,
                child: Row(
                  children: [
                    SizedBox(width: 12),
                    Text(
                      '${formatTime(_currentPosition.inSeconds.toInt())} / ${formatTime(_videoDuration.inSeconds.toInt())}',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: CustomVideoSlider(
                        currentValue: _currentPosition.inSeconds.toDouble(),
                        maxValue: _videoDuration.inSeconds.toDouble(),
                        onChanged: (value) {
                          _controller.seekTo(Duration(seconds: value.toInt()));
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                        color: Colors.white,
                      ),
                      onPressed: () {

                      } //_toggleFullScreen,
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (widget.height > 400 && _showControls == false)
          Align(
            alignment: Alignment.bottomCenter,
            child: LinearProgressIndicator(
              value: _videoDuration.inSeconds > 0
                  ? _currentPosition.inSeconds / _videoDuration.inSeconds
                  : 0.0,
              minHeight: 3.2,
              color: Colors.blueAccent,
            ),
          ),
      ],
    );
  }
}

class SaveShareDownloadButton extends StatelessWidget {
  final VoidCallback? ontab;
  final IconData icon;
  final String title;

  const SaveShareDownloadButton({
    super.key,
    this.ontab,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontab,
      child: Container(
        height: 35,
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueGrey.shade50.withOpacity(0.3),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.blueGrey.shade800,
              size: 16,
            ),
            SizedBox(width: 4),
            Text(
              title,
              style: TextStyle(
                color: Colors.blueGrey.shade800,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class CustomVideoSlider extends StatelessWidget {
  final double currentValue;
  final double maxValue;
  final ValueChanged<double> onChanged;
  final Color? thumbColor;

  const CustomVideoSlider({
    Key? key,
    required this.currentValue,
    required this.maxValue,
    required this.onChanged,
    this.thumbColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 2.0,
        // Minimal track height
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 4.0),
        // Small thumb
        overlayShape: SliderComponentShape.noOverlay,
        // No overlay for a clean look
        activeTrackColor: Colors.blueAccent,
        inactiveTrackColor: Colors.grey.withOpacity(0.5),
        thumbColor: thumbColor ?? Colors.white,
      ),
      child: Slider(
        value: currentValue,
        min: 0,
        max: maxValue,
        onChanged: onChanged,
      ),
    );
  }
}
