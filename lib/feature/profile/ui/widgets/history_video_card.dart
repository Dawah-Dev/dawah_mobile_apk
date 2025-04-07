import 'package:flutter/material.dart';

class HistoryVideoCard extends StatelessWidget {
  const HistoryVideoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 100 * (16 / 9),
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  'https://img.youtube.com/vi/rXvbTuYa0UI/hqdefault.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 6),
            Text(
              'বিক্ষিপ্ত স্বপ্নগুলো ┇ Cover by আহমাদ ফাইয়াজ ┇ Heart Touching Nasheed ┇ Ummah Studio',
              style: TextStyle(
                fontSize: 12,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Icon(
                  Icons.history_toggle_off,
                  size: 16,
                  color: Colors.blueGrey,
                ),
                SizedBox(width: 4),
                Text(
                  '1:20',
                  style: TextStyle(color: Colors.blueGrey),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
