// import 'package:dawah_mobile_application/feature/common/data/db/database_helper.dart';
// import 'package:dawah_mobile_application/feature/common/data/model/video_info_model.dart';
// import 'package:youtube_explode_dart/youtube_explode_dart.dart';
// import 'dart:ui';
//
// void main() async {
//   var yt = YoutubeExplode();
//
//
//   var channel = await yt.channels.get('UCdC58Fno7uiux5-fDWb3F4Q');
//   print('🔹 Channel Name: ${channel.title}');
//   print('📷 Channel Image: ${channel.logoUrl}');  print('🔹 Channel Name: ${channel.title}');
//   print('📷 Channel Image: ${channel.logoUrl}');
//   var playlist = await yt.channels.getUploads(channel.id);
//
//
//   await for (var video in playlist) {
//     DatabaseHelper databaseHelper = DatabaseHelper();
//   //   databaseHelper.insertVideo(
//   //     VideoInfoModel(
//   //         vid: video.id.toString(),
//   //         title: video.title.toString(),
//   //         description: video.description.toString(),
//   //         author: video.author.toString(),
//   //         uploading: video.uploadDate.toString(),
//   //         vlenth: video.duration.toString(),
//   //         thum: video.thumbnails.mediumResUrl.toString())
//   //   );
//   // }
//
//   yt.close();
// }
