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
    const CardItem(
      downloadedImage: "assets/images/Ambrym.png",
      title: 'Ambrym',
      subtitle: 'Vanuatu',
    ),
    const CardItem(
      downloadedImage: "assets/images/arenal.png",
      title: 'Arenal volcano',
      subtitle: 'Costa Rica',
    ),
    const CardItem(
      downloadedImage: "assets/images/asama.png",
      title: 'Asama volcano',
      subtitle: 'Japan',
    ),
    const CardItem(
      downloadedImage: "assets/images/volcanfuegocolima.png",
      title: 'Colima Fuego',
      subtitle: 'Mexico',
    ),
    const CardItem(
      downloadedImage: "assets/images/erebus.png",
      title: 'Erebus',
      subtitle: 'Antarctica',
    ),
    const CardItem(
      downloadedImage: "assets/images/Erta_Ale.png",
      title: 'Erta Ale',
      subtitle: 'Ethiopia',
    ),
    const CardItem(
      downloadedImage: "assets/images/Hekla.png",
      title: 'Hekla',
      subtitle: 'Iceland',
    ),
    const CardItem(
      downloadedImage: "assets/images/karymskynew.png",
      title: 'Karymsky',
      subtitle: 'Russia',
    ),
    const CardItem(
      downloadedImage: "assets/images/kilauea.png",
      title: 'Kilauea',
      subtitle: 'Hawaiian islands USA',
    ),
    const CardItem(
      downloadedImage: "assets/images/merapi.png",
      title: 'Merapi',
      subtitle: 'Indonesia',
    ),
    const CardItem(
      downloadedImage: "assets/images/Pacaya.png",
      title: 'Pacaya',
      subtitle: 'Guatemala',
    ),
    const CardItem(
      downloadedImage: "assets/images/semeru.png",
      title: 'Semeru',
      subtitle: 'Indonesia',
    ),
    const CardItem(
      downloadedImage: "assets/images/Stromboli.png",
      title: 'Stromboli',
      subtitle: 'Sicily Italy',
    ),
    const CardItem(
      downloadedImage: "assets/images/tungurahua.png",
      title: 'Tungurahua',
      subtitle: 'Ecuador',
    ),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Volcanoes Horizontal Scrollable ListView"),
          centerTitle: true,
        ),
        body: Container(
          height: 256,
          child: ListView.separated(
            padding: EdgeInsets.all(16),
            scrollDirection: Axis.horizontal,
            itemCount: 14,
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
