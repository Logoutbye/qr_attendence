import 'package:flutter/material.dart';

class BackArrowWidget extends StatelessWidget {
  final BuildContext context;

  const BackArrowWidget({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
