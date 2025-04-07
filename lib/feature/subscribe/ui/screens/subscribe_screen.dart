import 'package:dawah_mobile_application/app/app_logo.dart';
import 'package:dawah_mobile_application/feature/common/ui/widgets/channel_subscribe_Item.dart';
import 'package:flutter/material.dart';

class SubscribeScreen extends StatefulWidget {
  const SubscribeScreen({super.key});

  @override
  State<SubscribeScreen> createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen> {
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
      body: ListView.builder(itemBuilder: (context, index) {
        return ChannelSubscribeItem(index: index);
      },),
    );
  }
}
