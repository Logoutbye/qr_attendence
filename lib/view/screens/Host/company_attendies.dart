import 'package:flutter/material.dart';
import 'package:qr_attendence/config/theme/theme.dart';

import 'package:qr_attendence/core/components/app_constant_widget_style.dart';

import 'package:qr_attendence/provider/dob_provider.dart';
import 'package:qr_attendence/view/screens/Host/weekly_attendece.dart';

class CompanyAttendies extends StatefulWidget {
  const CompanyAttendies({super.key});

  @override
  State<CompanyAttendies> createState() => _CompanyAttendiesState();
}

class _CompanyAttendiesState extends State<CompanyAttendies> {
  @override
  void initState() {
    super.initState();
  }

  DateTime date = DateTime.now();

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1900),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(15),
                height: height * 0.06,
                width: width * 0.5,
                decoration: ShapeDecoration(
                    // color: Themecolor.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    shadows: AppConstantsWidgetStyle.kShadows,
                    gradient: AppConstantsWidgetStyle.kgradientButton),
                child: Center(
                    child: InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Text(
                          'Select Date: ${formatDateIs(date)}',
                          style: TextStyle(color: Themecolor.white,fontWeight: FontWeight.bold),
                        ))),
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: height * 0.06,
                width: width * 0.3,
                decoration: ShapeDecoration(
                    // color: Themecolor.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    shadows: AppConstantsWidgetStyle.kShadows,
                    gradient: AppConstantsWidgetStyle.kgradientButton),
                child: Center(
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WeeklyAttendese(),
                              ));
                        },
                        child: Text('Weekly',style: TextStyle(color: Themecolor.white,fontWeight: FontWeight.bold),))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
