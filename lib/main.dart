import 'package:animations/page%20transition/route.dart';
import 'package:flutter/material.dart';

import 'draggable_card.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dragging Widget animation'),
      ),
      body: const DraggableCard(
          child: FlutterLogo(
        size: 128,
      )),
      bottomSheet: GestureDetector(
        onTap: () {
          Navigator.push(context, createRoute());
        },
        child: Container(
          height: 50,
          margin:
              const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.orangeAccent),
          child: const Center(
              child: Text('Animated Container Demo')),
        ),
      ),
    );
  }
}
