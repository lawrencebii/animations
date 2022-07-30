import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

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
  Alignment alignment = Alignment.centerRight;
  late Animation<Alignment> animation;
  void _runAnimation(Offset pixelsPerSecond, Size size) {
    animation = animationController.drive(AlignmentTween(
      begin: alignment,
      end: Alignment.center,
    ));
    // Calculate  the velocity relative to the unit interval 0-1 used by
    // the animation controller
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY =
        pixelsPerSecond.dy / size.height;
    final unitsPerSecond =
        Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;
    const spring = SpringDescription(
        mass: 30, stiffness: 1, damping: 1);
    final simulation =
        SpringSimulation(spring, 0, 1, unitVelocity);
    animationController.animateWith(simulation);
    // animationController.reset();
    // animationController.forward();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 3));
    animationController.addListener(() {
      setState(() {
        alignment = animation.value;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onPanDown: ((details) {
        animationController.stop();
      }),
      onPanUpdate: ((details) {
        alignment += Alignment(
            details.delta.dx / (size.width / 2),
            details.delta.dy / (size.height / 2));
      }),
      onPanEnd: ((details) {
        _runAnimation(
            details.velocity.pixelsPerSecond, size);
      }),
      child: Align(
        alignment: alignment,
        child: Card(
          child: widget.child,
        ),
      ),
    );
  }
}
