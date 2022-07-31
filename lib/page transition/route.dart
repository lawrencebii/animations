import 'package:animations/conta_anim.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route createRoute() {
  return PageRouteBuilder(
      transitionDuration: const Duration(seconds: 1),
      reverseTransitionDuration: const Duration(seconds: 1),
      transitionsBuilder:
          (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        // final tween = Tween(begin: begin, end: end);

        // adding a curve
        var curve = Curves.easeInOutCubicEmphasized;
        var curveTween = CurveTween(curve: curve);
        // Combining the two tweens
        var tween =
            Tween(begin: begin, end: end).chain(curveTween);
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          
          position: offsetAnimation,
          child: child,
        );
      },
      pageBuilder:
          ((context, animation, secondaryAnimation) =>
              const AnimateContainer()));
}

// class MyRoute extends Route {

//   MyRoute({required Route route})
//       : super(route: route);
//   @override
//   Duration get transitionDuration => Duration(seconds: 3);
// }
