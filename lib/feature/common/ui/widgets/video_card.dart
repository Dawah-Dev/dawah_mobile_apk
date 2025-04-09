import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  final Map<String,dynamic>? videoinfo;
  const VideoCard({super.key, this.videoinfo});

  @override
  Widget build(BuildContext context) {
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
                  child: Image.network(videoinfo?['thum']??
                    'https://i.ytimg.com/vi/Eysh8W9Veow/hqdefault.jpg?sqp=-oaymwEnCNACELwBSFryq4qpAxkIARUAAIhCGAHYAQHiAQoIGBACGAY4AUAB&rs=AOn4CLD2xID4HvycaI2tRoYiCHfUrzJfkQ',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 2,horizontal: 6),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(4)
                    ),
                    child: Text(
                      formatTime(videoinfo?['vlenth']??'1:03:26.000000')??
                      '1:50',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold,),),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage('https://yt3.ggpht.com/ytc/AIdro_lbVZ9wgnA-LZ4HoESZeMUTU-IqvnlRGaaLWtRyaLCm4Ns=s48-c-k-c0x00ffffff-no-rj'),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      videoinfo?['title']??
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
                        height: 1.1,
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
  }
  String formatTime(String timeStr) {
    // Split time string
    List<String> parts = timeStr.split(":");
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    int seconds = int.parse(parts[2].split(".")[0]);

    if (hours > 0) {
      return "$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
    } else {
      return "$minutes:${seconds.toString().padLeft(2, '0')}";
    }
  }


}
