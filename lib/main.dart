import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Horizontal Scrollable ListView"),
          centerTitle: true,
        ),
        body: Container(
          height: 200,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                buildCard(),
                SizedBox(width: 12),
                buildCard(),
                SizedBox(width: 12),
                buildCard(),
                SizedBox(width: 12),
                buildCard(),
              ],
            ),
          ),
        ),
      );

  Widget buildCard() => Container(
        width: 200,
        height: 200,
        color: Colors.red[200],
        child: Column(
          children: [
            Image.asset("assets/images/comunicado0.png"),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Shoe XYZ',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              '€90',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
      );
}
