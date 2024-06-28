import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_attendence/provider/theme_provider.dart';
import 'package:qr_attendence/services/splash_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ThemeToggle(),
      // body: Center(
      //   child: Text(
      //     'Splash screen',
      //     style: TextStyle(color: Colors.red),
      //   ),
      // ),
    );
  }
}

class ThemeToggle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
