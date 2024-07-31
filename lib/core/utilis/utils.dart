import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_attendence/config/theme/theme.dart';

class Utils {
  // Function to dismiss the keyboard
  static dismissKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

showFlushbar(String message, BuildContext context) {
  Flushbar(
    // title: title,
    // titleColor: AppConstants.kcsecondaryColor,
    message: message,
    // messageColor: AppConstants.kcsecondaryColor,
    duration: Duration(seconds: 2),
    reverseAnimationCurve: Curves.easeInBack,
    forwardAnimationCurve: Curves.linear,
    // backgroundColor: AppConstants.kcgreenbgColor,
    padding: EdgeInsets.all(12),
    maxWidth: MediaQuery.of(context).size.width / 1.1,
    margin: EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(20),
    positionOffset: 20,
  )..show(context);
}

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
          backgroundColor: Themecolor.flushbar,
          content: Text(
            message,
            style: const TextStyle(color:Themecolor.white),
          )));
  }
  
}