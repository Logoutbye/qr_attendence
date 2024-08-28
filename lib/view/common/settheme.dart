import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_attendence/provider/theme_provider.dart';

class Themeset extends StatefulWidget {
  const Themeset({super.key});

  @override
  State<Themeset> createState() => _ThemesetState();
}

class _ThemesetState extends State<Themeset> {
  @override
  Widget build(BuildContext context) {
       final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Theme set'),),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => themeProvider.setThemeMode(ThemeModeEnum.light),
            child: Text('Light Theme'),
          ),
          ElevatedButton(
            onPressed: () => themeProvider.setThemeMode(ThemeModeEnum.dark),
            child: Text('Dark Theme'),
          ),
          ElevatedButton(
            onPressed: () => themeProvider.setThemeMode(ThemeModeEnum.system),
            child: Text('System Theme'),
          ),
        ],
      ),
    );
  }
}