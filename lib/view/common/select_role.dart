import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
import 'package:qr_attendence/view/widget/widget.dart';

class SelectRole extends StatefulWidget {
  const SelectRole({super.key});

  @override
  State<SelectRole> createState() => _SelectRoleState();
}

class _SelectRoleState extends State<SelectRole> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Themecolor.white,
      body: Column(
        children: [
          Container(
            height: height * 0.5,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Themecolor.white,
            ),
            child: Image.asset(
                width: width * 0.4,
                height: height * 0.1,
                'assets/images/attendece.png'),
          ),
          Container(
            height: height * 0.5,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                gradient: AppConstantsWidgetStyle.kgradientScreen),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context,RoutesName.signin);
                    },
                    child: Container(
                      width: width * 0.8,
                      height: 48,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Themecolor.primary, Themecolor.primaryLight],
                          // colors:[Themecolor.primary,  Themecolor.primaryLight],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                          child: Text(
                        'Continue with Host',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RoutesName.loginEmploy);
                    },
                    child: Container(
                      width: width * 0.8,
                      height: 48,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Themecolor.primary, Themecolor.primaryLight],
                          // colors:[Themecolor.primary,  Themecolor.primaryLight],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                          child: Text(
                        'Continue with Visiter',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
