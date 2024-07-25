import 'package:flutter/material.dart';

class GappedWidget extends StatelessWidget {
  // final Widget child;
  final double? leftGap;
  final double? rightGap;
  final double? topGap;
  final double? bottomGap;

  const GappedWidget({
    super.key,
    // required this.child,
    this.leftGap,
    this.rightGap,
    this.topGap,
    this.bottomGap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        leftGap ?? _defaultGap(context),
        topGap ?? _defaultGap(context),
        rightGap ?? _defaultGap(context),
        bottomGap ?? _defaultGap(context),
      ),
      // child: child,
    );
  }

  double _defaultGap(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.01; // 5% of screen width
  }
}
