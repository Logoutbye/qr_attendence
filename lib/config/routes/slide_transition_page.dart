// import 'package:flutter/material.dart';

// // navigate to first screen
// // navigatorKey.currentState!.popUntil((route) => route.isFirst);

import 'package:flutter/material.dart';

class SlideTransitionPage extends PageRouteBuilder {
  final Widget page;
  final bool applySlideTransition;
  final SlideDirection slideDirection;

  SlideTransitionPage({
    required this.page,
    this.applySlideTransition = true,
    this.slideDirection = SlideDirection.left,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            if (applySlideTransition) {
              Offset beginOffset;
              Offset endOffset;

              switch (slideDirection) {
                case SlideDirection.left:
                  beginOffset = const Offset(1.0, 0.0);
                  endOffset = Offset.zero;
                  break;
                case SlideDirection.right:
                  beginOffset = const Offset(-1.0, 0.0);
                  endOffset = Offset.zero;
                  break;
                case SlideDirection.top:
                  beginOffset = const Offset(0.0, 1.0);
                  endOffset = Offset.zero;
                  break;
                case SlideDirection.bottom:
                  beginOffset = const Offset(0.0, -1.0);
                  endOffset = Offset.zero;
                  break;
              }

              return SlideTransition(
                position: Tween<Offset>(
                  begin: beginOffset,
                  end: endOffset,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOut, // Use a curve for smoother animation
                  reverseCurve: Curves
                      .easeIn, // Use a curve for smoother reverse animation
                )),
                child: child,
              );
            } else {
              return child;
            }
          },
        );
}

enum SlideDirection { left, right, top, bottom }
