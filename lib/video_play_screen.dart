import 'package:flutter/material.dart';

class VideoPlayScreen extends StatefulWidget {
  final double height;
  const VideoPlayScreen({Key? key, required this.height}) : super(key: key);

  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  late double displayWidth;

  @override
  Widget build(BuildContext context) {
    displayWidth = MediaQuery.of(context).size.width;

    return Container(
      height: widget.height,
      width: displayWidth,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: widget.height > displayWidth*(9/16) ? displayWidth*(9/16): widget.height-4 ,
                  width: widget.height > 61
                      ? displayWidth
                      : (widget.height * (16 / 9)),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      'https://img.youtube.com/vi/LyvLFabtZhI/hqdefault.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              if (widget.height < 61)
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                         Expanded(child: Text('Emotional Nasheed | হে আমার মা! | COVER BY AHMAD FAIYAAZ',maxLines: 2,overflow: TextOverflow.ellipsis,)),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.play_arrow),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.close),
                          ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          if(widget.height < 61)
          Divider(height: 2,color: Colors.blueAccent,),


          if(widget.height > displayWidth*(9/16))
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                color: Colors.transparent,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('data'),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
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
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
