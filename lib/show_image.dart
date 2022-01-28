import 'package:flutter/material.dart';
import 'package:flutter_horizontal_listview/main.dart';

class ShowImage extends StatelessWidget {
  final CardItem item;

  const ShowImage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(item.title),
        ),
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.asset(
                item.downloadedImage,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item.title,
              style: TextStyle(fontSize: 32),
            ),
            Text(
              item.subtitle,
              style: TextStyle(fontSize: 32),
            ),
          ],
        ),
      );
}
