import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_attendence/config/routes/routes.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/provider/Signin_provider.dart';
import 'package:qr_attendence/provider/create_event_provider.dart';
import 'package:qr_attendence/provider/create_people_provider.dart';
import 'package:qr_attendence/provider/date_provider.dart';
import 'package:qr_attendence/provider/signup_provider.dart';
import 'package:qr_attendence/provider/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<EventProvider>(create: (_) => EventProvider()),
        ChangeNotifierProvider<PeopleProvider>(create: (_) => PeopleProvider()),
        ChangeNotifierProvider<SigninProvider>(create: (_) => SigninProvider()),
        ChangeNotifierProvider<SignupProvider>(create: (_) => SignupProvider()),

        // ChangeNotifierProvider<dateprovider>(create: (_) => dateprovider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.getThemeMode(),
            title: 'Flutter Demo',
            initialRoute: RoutesName.splashScreen,
            onGenerateRoute: Routes.generateRoute,
            // home: DashBoardHost(),
          );
        },
      ),
    );
  }
}
