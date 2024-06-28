import 'package:flutter/material.dart';

extension TextStyleExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}