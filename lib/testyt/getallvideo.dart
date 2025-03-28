import 'package:youtube_explode_dart/youtube_explode_dart.dart';

void main() async {
  var yt = YoutubeExplode();


  var channel = await yt.channels.get('UCdC58Fno7uiux5-fDWb3F4Q');
  print('🔹 Channel Name: ${channel.title}');
  print('📷 Channel Image: ${channel.logoUrl}');  print('🔹 Channel Name: ${channel.title}');
  print('📷 Channel Image: ${channel.logoUrl}');
  var playlist = await yt.channels.getUploads(channel.id);


  await for (var video in playlist) {
    print(video.title);
    print(video.id);
    print(video.description);
    print(video.author);
    print(video.uploadDate);
    print(video.thumbnails.mediumResUrl);
    print('==========================\n\n');
  }

  yt.close();
}
