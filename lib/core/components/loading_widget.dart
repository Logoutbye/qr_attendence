import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb && Platform.isIOS) {
      return const CupertinoActivityIndicator(); // Show CupertinoActivityIndicator on iOS
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    // return const Center(
    //   child: CircularProgressIndicator(),
    // );
  }
}
