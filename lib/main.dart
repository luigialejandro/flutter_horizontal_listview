import 'package:flutter/material.dart';
import 'package:flutter_horizontal_listview/show_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class CardItem {
  final String downloadedImage;
  final String title;
  final String subtitle;

  const CardItem({
    required this.downloadedImage,
    required this.title,
    required this.subtitle,
  });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CardItem> items = [
    CardItem(
      downloadedImage: "assets/images/comunicado0.png",
      title: 'Acontecimientos',
      subtitle: 'Comunicado SAT',
    ),
    CardItem(
      downloadedImage: "assets/images/comunicado1.png",
      title: 'Declaración anual',
      subtitle: 'Personas físicas',
    ),
    CardItem(
      downloadedImage: "assets/images/comunicado2.png",
      title: 'Inconsistencias',
      subtitle: 'Contribuyentes',
    ),
    CardItem(
      downloadedImage: "assets/images/comunicado3.png",
      title: 'Informa al SAT',
      subtitle: 'Situación fiscal',
    ),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Horizontal Scrollable ListView"),
          centerTitle: true,
        ),
        body: Container(
          height: 256,
          child: ListView.separated(
            padding: EdgeInsets.all(16),
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            separatorBuilder: (context, _) => SizedBox(width: 12),
            itemBuilder: (context, index) => buildCard(item: items[index]),
          ),
        ),
      );

  Widget buildCard({
    required CardItem item,
  }) =>
      Container(
        width: 200,
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Material(
                    child: Ink.image(
                      image: AssetImage(item.downloadedImage),
                      fit: BoxFit.cover,
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowImage(
                              item: item,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              item.title,
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            Text(
              item.subtitle,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
      );
}
