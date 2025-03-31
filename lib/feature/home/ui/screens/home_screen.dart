import 'package:dawah_mobile_application/feature/common/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
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
                                padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(4)
                                ),
                                child: Text('1:50',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold,),),
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
                            radius: 20,
                            backgroundImage: NetworkImage('https://yt3.ggpht.com/ytc/AIdro_lbVZ9wgnA-LZ4HoESZeMUTU-IqvnlRGaaLWtRyaLCm4Ns=s48-c-k-c0x00ffffff-no-rj'),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
          )
        ],
      ),
    );
  }
}
