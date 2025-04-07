import 'package:dawah_mobile_application/feature/common/ui/widgets/video_card.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Map<String, dynamic>> _serachQuarydata = [
    {'sdas': 1}
  ];
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: SizedBox(
          height: 40, // Adjust the height as needed
          child: TextField(
            controller: _searchController,
            style: TextStyle(fontSize: 13),
            cursorHeight: 17,
            cursorColor: Colors.black,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.blueGrey.shade400,
              ),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        setState(() {});
                      },
                    )
                  : null,
              // Hide button if no text
              fillColor: Colors.blueGrey.shade50,
              hintStyle: TextStyle(fontSize: 13, color: Colors.blueGrey),
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              hintText: 'Search',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            ),
            onChanged: (text) {
              setState(() {});
            },
          ),
        ),
        actions: [
          if (_searchController.text.isEmpty)
            CircleAvatar(
              backgroundColor: Colors.blueGrey.shade50,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_voice,
                  color: Colors.blueGrey.shade600,
                ),
              ),
            ),
          if (_searchController.text.isEmpty) SizedBox(width: 14)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Visibility(
          visible: _serachQuarydata.isNotEmpty,
          replacement: Text(
            'আপনি যে চ্যানেল গুলো সাবস্ক্রাইব করেছেন , শুধু  ওই চ্যানেল গুলোর কনটেন্টই সার্চ করে দেখতে পারবেন। চ্যানেল সাবস্ক্রাইব করার জন্য সাবস্ক্রাইব সেকশন এ যান।',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 15,
            ),
          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return VideoCard();
            },
          ),
        ),
      ),
    );
  }
}
