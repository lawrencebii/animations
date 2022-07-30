import 'package:flutter/material.dart';

class DraggableCard extends StatefulWidget {
  final Widget child;
  const DraggableCard({Key? key, required this.child})
      : super(key: key);

  @override
  State<DraggableCard> createState() =>
      _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Card(
        child: widget.child,
      ),
    );
  }
}
