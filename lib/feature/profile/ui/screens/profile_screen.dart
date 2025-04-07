import 'package:dawah_mobile_application/app/app_logo.dart';
import 'package:dawah_mobile_application/feature/profile/ui/widgets/history_video_card.dart';
import 'package:dawah_mobile_application/feature/profile/ui/widgets/section_header.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16),
                SectionHeader(),
                SizedBox(height: 16),
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return HistoryVideoCard();
                    },
                  ),
                ),
                SizedBox(height: 16),
                Divider(
                  color: Colors.blueGrey.shade50,
                  height: 0.5,
                ),
                SizedBox(height: 16),
                ListTile(
                  leading: Icon(Icons.bookmark_added_outlined),
                  title: Text('Save video'),
                ),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text('History controller'),
                ),
                ListTile(
                  leading: Icon(Icons.video_library_outlined),
                  title: Text('Video suggestion mode'),
                ),
                ListTile(
                  leading: Icon(Icons.wb_sunny_outlined),
                  title: Text('Theme'),
                ),
                ListTile(
                  leading: Icon(Icons.multitrack_audio),
                  title: Text('Background play'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


