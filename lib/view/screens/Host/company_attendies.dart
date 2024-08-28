import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
import 'package:qr_attendence/provider/company/attendence_bydate_provider.dart';
import 'package:qr_attendence/view/screens/Host/generate_qr.dart';
import 'package:qr_attendence/view/screens/Host/weekly_attendece.dart';

class CompanyAttendies extends StatefulWidget {
  final String companycode;
  const CompanyAttendies({super.key, required this.companycode});

  @override
  State<CompanyAttendies> createState() => _CompanyAttendiesState();
}

class _CompanyAttendiesState extends State<CompanyAttendies> {
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

      // Fetch attendance for the selected date
      final provider =
          Provider.of<AttendanceByDateProvider>(context, listen: false);
      provider.fetchAttendanceByDate(DateFormat('yyyy-MM-dd').format(date));
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final attendeceBYdate=Provider.of<AttendanceByDateProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  height: height * 0.06,
                  width: width * 0.5,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadows: AppConstantsWidgetStyle.kShadows,
                    gradient: AppConstantsWidgetStyle.kgradientButton,
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Text(
                        'Select Date: ${DateFormat('MMM d, yyyy').format(date)}',
                        style: TextStyle(
                          color: Themecolor.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Consumer<AttendanceByDateProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Container(
                      margin: EdgeInsets.all(15),
                      height: height * 0.06,
                      width: width * 0.3,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        shadows: AppConstantsWidgetStyle.kShadows,
                        gradient: AppConstantsWidgetStyle.kgradientButton,
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            // Navigate to WeeklyAttendese screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WeeklyAttendese(
                                  attendanceRecords: value.attendanceList,
                                  // Pass the attendance records
                                  selectedDate: date, // Pass the selected date
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Weekly',
                            style: TextStyle(
                              color: Themecolor.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QRCodeGenerator(
                          data: widget.companycode,
                        ),
                      ),
                    );
                  },
                  child: Container(
                      margin: EdgeInsets.all(15),
                      height: height * 0.06,
                      width: width * 0.3,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        shadows: AppConstantsWidgetStyle.kShadows,
                        gradient: AppConstantsWidgetStyle.kgradientButton,
                      ),
                      child: Center(
                          child: Text(
                        'Generate Qr',
                        style: TextStyle(
                          color: Themecolor.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ))),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<AttendanceByDateProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (provider.attendanceList.isEmpty) {
                  return Center(child: Text('No attendance records found'));
                }

                return ListView.builder(
                  itemCount: provider.attendanceList.length,
                  itemBuilder: (context, index) {
                    final attendanceRecord = provider.attendanceList[index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            margin: EdgeInsets.all(5),
                            decoration: ShapeDecoration(
                              color: Themecolor.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              shadows: AppConstantsWidgetStyle.kShadows,
                            ),
                            child: ListTile(
                              title: Text(attendanceRecord.employee.username),
                              subtitle: Text(
                                  'Attended on ${DateFormat('MMM d, yyyy').format(date)}'),
                              leading: Icon(Icons.person),
                              trailing: attendanceRecord.checkOutTime != null
                                  ? Text('Present',
                                      style: TextStyle(color: Colors.green))
                                  : const Text('Absent',
                                      style: TextStyle(color: Colors.red)),
                            ),
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
