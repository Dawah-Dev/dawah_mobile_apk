import 'package:dawah_mobile_application/feature/common/ui/screens/main_bottom_navigation_screen.dart';
import 'package:dawah_mobile_application/app/app_logo.dart';
import 'package:dawah_mobile_application/feature/common/ui/widgets/channel_subscribe_Item.dart';
import 'package:flutter/material.dart';

class FirstTimeChannelConnectionScreen extends StatefulWidget {
  const FirstTimeChannelConnectionScreen({super.key});

  static String name = '/FirstTimeChannelConnectionScreen';

  @override
  State<FirstTimeChannelConnectionScreen> createState() =>
      _FirstTimeChannelConnectionScreenState();
}

class _FirstTimeChannelConnectionScreenState
    extends State<FirstTimeChannelConnectionScreen> {
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
              'Next 4/5',
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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ChannelSubscribeItem(index: index);
                },
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('See more channel'),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
              SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
