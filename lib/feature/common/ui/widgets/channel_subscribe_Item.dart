import 'package:dawah_mobile_application/feature/common/data/db/database_helper.dart';
import 'package:dawah_mobile_application/feature/common/data/model/video_info_model.dart';
import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class ChannelSubscribeItem extends StatefulWidget {
  final Map<String, dynamic> channelInfo;

  const ChannelSubscribeItem({super.key, required this.channelInfo});

  @override
  State<ChannelSubscribeItem> createState() => _ChannelSubscribeItemState();
}

class _ChannelSubscribeItemState extends State<ChannelSubscribeItem> {
  int _totalVideoCount = 0;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(widget.channelInfo['logo']),
      ),
      title: Text(widget.channelInfo['name']),
      trailing: ElevatedButton(
        onPressed: () async{
          bool isSuccess = await fatchChannelVideoGet(widget.channelInfo['cid']);
          if(isSuccess){
            Navigator.pop(context);
          }else{
            await Future.delayed(Duration(seconds: 2));
            Navigator.pop(context);
          }
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent, elevation: 0),
        child: Text(
          'Subscribe',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<bool> fatchChannelVideoGet(String vId) async {
    bool isSuccess = false;
    YoutubeExplode youtubeExplode = YoutubeExplode();
    var channel = await youtubeExplode.channels.get(vId);
    print('🔹 Channel Name: ${channel.title}');
    print('📷 Channel Image: ${channel.logoUrl}');
    var playlist = await youtubeExplode.channels.getUploads(channel.id);

    showDialog(
      useRootNavigator: true,
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(widget.channelInfo['logo']),
              ),
              SizedBox(width: 10),
              Text(channel.title),
            ],
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  'All the videos of this channel are being loaded on your device....'),
              SizedBox(height: 16),
              LinearProgressIndicator(color: Colors.blueAccent,),
            ],
          ),
        );
      },
    );

    await for (var video in playlist) {
      print(video.title);
      print(video.id);
      print(video.description);
      print(video.author);
      print(video.uploadDate);
      print(video.thumbnails.mediumResUrl);
      print(video.duration);
      DatabaseHelper databaseHelper = DatabaseHelper();
      databaseHelper.insertVideo(VideoInfoModel(
          vid: video.id.toString(),
          title: video.title.toString(),
          description: video.description.toString(),
          author: video.author.toString(),
          uploading: video.uploadDate.toString(),
          vlenth: video.duration.toString(),
          clogo: channel.logoUrl,
          thum: video.thumbnails.mediumResUrl.toString()));
    }
    isSuccess = true;
    return isSuccess;
  }
}
