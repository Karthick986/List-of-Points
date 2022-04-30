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
      title: 'Flutter Adv',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'List of Advantages'),
      debugShowCheckedModeBanner: false,
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
  int currentIndex = 0;
  List<String> listOfPoints = [
    "• Need to help in Hybrid App Development.",
  ];

  Widget buildPoints(index) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Text(listOfPoints[index], style: const TextStyle(fontSize: 22),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            Opacity(
                opacity: currentIndex >= 4 ? 0.5 : 1,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      currentIndex++;
                      switch (currentIndex) {
                        case 1:
                          listOfPoints.add(
                            "• Easy to Learn and Use from scratch.",
                          );
                          break;
                        case 2:
                          listOfPoints.add(
                            "• Developed by Google and made open source with clear documentation upto date.",
                          );
                          break;
                        case 3:
                          listOfPoints.add(
                            "• Cost effective and flexible to maintain.",
                          );
                          break;
                        case 4:
                          listOfPoints.add(
                              "• Integrate most of the libraries that support projects.");
                          break;
                        default:
                          break;
                      }
                    });
                  },
                  icon: const Icon(Icons.chevron_right_rounded),
                ))
          ],
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const FlutterLogo(
                size: 60,
              ),
              Container(
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                child: const Text("Why need of Flutter to build mobile apps?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28,
                color: Colors.deepPurpleAccent),),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return buildPoints(index);
                },
                itemCount: listOfPoints.length,
              )
            ],
          ),
        ));
  }
}
