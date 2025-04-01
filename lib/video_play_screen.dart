import 'package:dawah_mobile_application/third_party_library/mini_player/miniplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                onTap: () {},
                child: SizedBox(
                  height: widget.height > displayWidth * (9 / 16)
                      ? displayWidth * (9 / 16)
                      : widget.height - 4,
                  width: widget.height > 61
                      ? displayWidth
                      : (widget.height * (16 / 9)),
                  child: Stack(
                    children: [
                      YoutubePlayer(
                        aspectRatio: 16 / 9,
                        controller: YoutubePlayerController(
                          initialVideoId: 'TZUnW8OzvnM',
                          flags: YoutubePlayerFlags(
                            autoPlay: true,
                            hideControls: true,
                            mute: false,
                          ),
                        ),
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.blueAccent,
                        progressColors: const ProgressBarColors(
                          playedColor: Colors.blueAccent,
                          handleColor: Colors.blueAccent,
                        ),
                      ),
                      if (widget.height > 400)
                        IconButton(
                          onPressed: () {
                            widget.miniplayerController
                                .animateToHeight(state: PanelState.MIN);
                          },
                          icon: Icon(
                            Icons.arrow_drop_down_circle_outlined,
                            color: Colors.white.withOpacity(0.5),
                            size: 30,
                          ),
                        ),

                      if (widget.height > 400)
                        Center(
                          child: IconButton(
                            onPressed: () {
                              widget.miniplayerController
                                  .animateToHeight(state: PanelState.MIN);
                            },
                            icon: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.blueAccent,
                              child: Icon(Icons.play_arrow,color: Colors.white,size: 35,),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              if (widget.height < 61)
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 4),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Emotional Nasheed | হে আমার মা! | COVER BY AHMAD FAIYAAZ',
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
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.play_arrow),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
            ],
          ),
          if (widget.height < 61)
            LinearProgressIndicator(
              value: 0.3,
              minHeight: 3.2,
              color: Colors.blueAccent,
            ),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 12),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: Text(
                                'Emotional Nasheed | হে আমার মা! | COVER BY AHMAD FAIYAAZ',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: Text(
                                'Emotional Nasheed | হে আমার মা! ',
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
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
                                    icon: CupertinoIcons.share,
                                  ),
                                  SaveShareDownloadButton(
                                    title: 'Audio download',
                                    icon: Icons.multitrack_audio_sharp,
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
                            )
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Stack(
                                      children: [
                                        AspectRatio(
                                          aspectRatio: 16 / 9,
                                          child: Image.network(
                                            'https://i.ytimg.com/vi/Eysh8W9Veow/hqdefault.jpg?sqp=-oaymwEnCNACELwBSFryq4qpAxkIARUAAIhCGAHYAQHiAQoIGBACGAY4AUAB&rs=AOn4CLD2xID4HvycaI2tRoYiCHfUrzJfkQ',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 8,
                                          right: 8,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 8),
                                            decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Text(
                                              '1:50',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundImage: NetworkImage(
                                            'https://yt3.ggpht.com/ytc/AIdro_lbVZ9wgnA-LZ4HoESZeMUTU-IqvnlRGaaLWtRyaLCm4Ns=s48-c-k-c0x00ffffff-no-rj'),
                                      ),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'শামের বিজয়ে মুমিনদের আনন্দ ও শিক্ষা | Shaikh Tamim Al Adnani',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.2),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              'Ummah network • 24 Mar 2025',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                ],
                              ),
                            );
                          },
                        ),
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
              color: Colors.blueGrey,
              size: 16,
            ),
            SizedBox(width: 4),
            Text(
              title,
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
