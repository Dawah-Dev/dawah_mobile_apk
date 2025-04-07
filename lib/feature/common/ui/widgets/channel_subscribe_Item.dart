import 'package:flutter/material.dart';

class ChannelSubscribeItem extends StatelessWidget {
  const ChannelSubscribeItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text('Channel ${index + 1}'),
      subtitle: Text('Channel description'),
      trailing: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent, elevation: 0),
        child: Text(
          'Subscribe',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
