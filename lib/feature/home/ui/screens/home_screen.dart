import 'package:dawah_mobile_application/app/app_logo.dart';
import 'package:dawah_mobile_application/feature/common/data/db/database_helper.dart';
import 'package:dawah_mobile_application/feature/common/ui/widgets/video_card.dart';
import 'package:flutter/material.dart';

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
      body: RefreshIndicator(
        color: Colors.blueAccent,
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1));
          fatchVideoInfo();
        },
        child: Column(
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
                      itemCount: videoList.length,
                      itemBuilder: (context, index) {
                        return VideoCard(
                          videoinfo: videoList[index],
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Future<void> fatchVideoInfo() async {
    _inProgress = true;
    setState(() {});

    DatabaseHelper databaseHelper = DatabaseHelper();
    videoList = await databaseHelper.getInterleavedVideos();

    _inProgress = false;
    setState(() {});

  }
}
