// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:qr_attendence/config/routes/routes_name.dart';
// import 'package:qr_attendence/services/splash_services/session_handling.dart';

// class SplashServices {
//   // Future<String?> getAcademySignedInToken() =>
//   //     SessionHandling().getAcademySignedInToken();

//   // Future<String?> getStudentSignedInToken() =>
//   //     SessionHandling().getStudentSignedInToken();
//   // Future<String?> getTeacherSignedInToken() =>
//   //     SessionHandling().getTeacherSignedInToken();
//       //  Future<bool?> getthemedata() =>
//       // SessionHandling().getDarkMode();

//   Future<void> checkAuthentication(BuildContext context) async {
//     try {
//       // final academySignedInToken = await getAcademySignedInToken();
//       // final studentSignedInToken = await getStudentSignedInToken();
//       // final teacherSignedInToken = await getTeacherSignedInToken();
//       //  final getthemevalue = await getthemedata();
//       //  print("::: the value of themedata is :${getthemevalue}");

//       await Future.delayed(const Duration(seconds: 3));

//       if (academySignedInToken != null) {
//         Navigator.pushNamedAndRemoveUntil(
//             context, RoutesName.academyDashboard, (route) => false);
//         return;
//       } else if (studentSignedInToken != null) {
//         Navigator.pushReplacementNamed(context, RoutesName.studentDashboard);
//         return;
//       } else if (teacherSignedInToken != null) {
//         Navigator.pushNamedAndRemoveUntil(
//             context, RoutesName.teacherDashboard, (route) => false);
//         return;
//       } else {
//         Navigator.pushNamedAndRemoveUntil(
//             context, RoutesName.loginScreen, (route) => false);
//         // Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen,);
//       }
//     } catch (error) {
//       if (kDebugMode) {
//         print(error.toString());
//       }
//     }
//   }
// }
