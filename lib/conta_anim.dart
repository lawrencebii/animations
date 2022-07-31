import 'dart:math';

import 'package:flutter/material.dart';

class AnimateContainer extends StatefulWidget {
  const AnimateContainer({Key? key}) : super(key: key);

  @override
  State<AnimateContainer> createState() =>
      _AnimateContainerState();
}

class _AnimateContainerState
    extends State<AnimateContainer> {
  double width = 50;
  double height = 50;
  Color color = Colors.green;
  BorderRadiusGeometry borderRadius =
      BorderRadius.circular(10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: AnimatedContainer(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: color,
                ),
                duration: const Duration(seconds: 2)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final random = Random();
          // Generating random height

          width = random.nextInt(300).toDouble();
          height = random.nextInt(300).toDouble();
          // Generating random color
          color = Color.fromRGBO(
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
            1,
          );
          borderRadius = BorderRadius.circular(
              random.nextInt(80).toDouble());
          setState(() {});
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
