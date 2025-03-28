import 'package:dawah_mobile_application/feature/common/ui/widgets/app_logo.dart';
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
            onPressed: () {},
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
                  'পরবর্তী ধাপে যেতে, অনুগ্রহ করে কমপক্ষে ৫টি চ্যানেলের সাথে সংযোগ স্থাপন করুন।',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(),
                    title: Text('Channel ${index+1}'),
                    subtitle: Text('Channel description'),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent, elevation: 0),
                      child: Text(
                        'Connect',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
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
