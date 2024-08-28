import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_attendence/config/constants/assetspath.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
import 'package:qr_attendence/core/components/splash_services.dart';
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
   Future.delayed(Duration(seconds: 5)).then((_) {
      Navigator.pushReplacementNamed(context, RoutesName.selectRole);
     splashServices.checkAuthentication(context);
      
    
  });
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
    final height=MediaQuery.of(context).size.height;
        final width=MediaQuery.of(context).size.width;

    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: AppConstantsWidgetStyle.kgradientScreen,
        
      ),
      child: Center(child:  Image.asset(
                  AssetPaths.qrlogos,
                  height: height * 0.9,
                  width: width * 0.9,
                  
                ),),
    );
  }
}
