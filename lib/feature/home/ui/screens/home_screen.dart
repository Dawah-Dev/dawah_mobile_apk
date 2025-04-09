import 'package:dawah_mobile_application/app/app_logo.dart';
import 'package:dawah_mobile_application/feature/common/ui/widgets/video_card.dart';
import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _inProgress = false;
  List<Map<String,dynamic>> videoList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fatchVideoInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: AppLogo(
          size: 115,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Divider(
            color: Colors.blueGrey.shade50,
            height: 0.5,
          ),
          _inProgress == true
              ? CircularProgressIndicator()
              : Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      return VideoCard(
                        videoinfo: videoList[index],
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }

  Future<void> fatchVideoInfo() async {
    _inProgress = true;
    setState(() {});

    YoutubeExplode youtubeExplode = YoutubeExplode();
    var channel = await youtubeExplode.channels.get('UCdC58Fno7uiux5-fDWb3F4Q');
    print('🔹 Channel Name: ${channel.title}');
    print('📷 Channel Image: ${channel.logoUrl}');
    var playlist = await youtubeExplode.channels.getUploads(channel.id);

    _inProgress = false;

    await for (var video in playlist) {
      print(video.title);
      print(video.id);
      print(video.description);
      print(video.author);
      print(video.uploadDate);
      print(video.thumbnails.mediumResUrl);
      print(video.duration);
      videoList.add({
        'id':video.id,
        'title':video.title,
        'des':video.description,
        'author':video.author,
        'uploading':video.uploadDate,
        'vlenth':video.duration.toString(),
        'thum':video.thumbnails.mediumResUrl,
      });
      setState(() {});
    }
  }
}
