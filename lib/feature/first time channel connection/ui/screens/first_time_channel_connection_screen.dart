import 'package:dawah_mobile_application/app/app_logo.dart';
import 'package:dawah_mobile_application/feature/common/ui/screens/main_bottom_navigation_screen.dart';
import 'package:dawah_mobile_application/feature/common/ui/widgets/channel_subscribe_Item.dart';
import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class FirstTimeChannelConnectionScreen extends StatefulWidget {
  const FirstTimeChannelConnectionScreen({super.key});

  static String name = '/FirstTimeChannelConnectionScreen';

  @override
  State<FirstTimeChannelConnectionScreen> createState() =>
      _FirstTimeChannelConnectionScreenState();
}

class _FirstTimeChannelConnectionScreenState
    extends State<FirstTimeChannelConnectionScreen> {
  bool inprogress = false;
  int subscribeCount = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fatchChannelInfo();
  }

  final List<Map<String, dynamic>> _channelInfo = [];

  Future<void> fatchChannelInfo() async {
    setState(() {
      inprogress = true;
    });

    List<String> channelid = [
      'UCuxth2BimHUigZ344JhcFPw',
      'UCJBFlQxBr4skX7Er5-hSNnA',
      'UCdC58Fno7uiux5-fDWb3F4Q',
      'UCOuLIzE_eeEOO1ybC_J8JuQ',
      'UCQ92zH1kt6CHYOhIpg8-eEw',
      'UC4XAyY0HcNirlm78BlGLiLA',
      'UC7kCl17f3Mqx2YUhrvRaUug',
      'UCVhUNnaQ0S7ywSApsc1Hx0Q',
      'UCAPbeZYTsKaRd0Xe5gs2o6A',
      'UCX-i9fECoJPF42TvOwwoiTw'
    ];



    YoutubeExplode youtubeExplode = YoutubeExplode();

    try {
      for (int i = 0; i < channelid.length + 1; i++) {
        var channel = await youtubeExplode.channels.get(channelid[i]);
        _channelInfo.add({
          'name': channel.title,
          'logo': channel.logoUrl,
          'sub': channel.subscribersCount,
          'cid':channelid[i],
        });
        inprogress = false;
        setState(() {});
      }
    } catch (e) {
      print('Error fetching channel info: $e');
    }
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
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                MainBottomNavigationScreen.name,
                (route) => false,
              );
            },
            style: OutlinedButton.styleFrom(
              fixedSize: Size(104, 35),
              foregroundColor: Colors.blueAccent,
              side: BorderSide(
                color: Colors.blueAccent,
              ),
            ),
            child: Text(
              'Next $subscribeCount/5',
              style: TextStyle(
                color: Colors.blueAccent,
              ),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'পরবর্তী ধাপে যেতে, অনুগ্রহ করে কমপক্ষে ৫টি চ্যানেল সাবস্ক্রাইব করুন।',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 8),
              ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _channelInfo.length,
                      itemBuilder: (context, index) {
                        return ChannelSubscribeItem(
                          channelInfo: _channelInfo[index],
                        );
                      },
                    ),
              SizedBox(height: 16),
              if(inprogress == true)
              CircularProgressIndicator(color: Colors.blueAccent,),
              SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
