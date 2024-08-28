// import 'package:flutter/material.dart';
// import 'package:qr_attendence/config/theme/theme.dart';
// import 'package:qr_attendence/core/components/app_constant_widget_style.dart';

// class ViewEventsAttendance extends StatefulWidget {
//   const ViewEventsAttendance({Key? key}) : super(key: key);

//   @override
//   State<ViewEventsAttendance> createState() => _ViewEventsAttendanceState();
// }

// class _ViewEventsAttendanceState extends State<ViewEventsAttendance> {
//   // Example list of attendance data (replace with your actual data model)
//   List<String> attendanceList = [
//     'Employee 1 - Present',
//     'Employee 2 - Absent',
//     'Employee 3 - Present',
//     'Employee 4 - Present',
//     'Employee 5 - Absent',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//             decoration: BoxDecoration(gradient: AppConstantsWidgetStyle.kgradientScreen),

//       child: Scaffold(
//                 backgroundColor: Colors.transparent,

//         appBar: AppBar(
//           leading: Icon(Icons.arrow_back,color: Themecolor.white,),
//           title: Text('Event Attendance List',style:TextStyle(color: Themecolor.white),),
//         ),
//         body: ListView.builder(
//           itemCount: attendanceList.length,
//           itemBuilder: (context, index) {
//             // Extracting employee name and attendance status
//             String attendanceEntry = attendanceList[index];
//             // Splitting the entry to separate employee name and status
//             List<String> entryParts = attendanceEntry.split(' - ');

//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                  margin: EdgeInsets.all(5),
//                           decoration: ShapeDecoration(
//                             color: Themecolor.white,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             shadows: AppConstantsWidgetStyle.kShadows,
//                           ),
//                 child: ListTile(
//                   title: Text(entryParts[0]), // Employee name
//                   subtitle: Text(entryParts[1]), // Attendance status
//                   leading: CircleAvatar(
//                     child: Text(entryParts[0][0]), // Initials of the employee
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
import 'package:qr_attendence/data/model/fetch_event_attendence_for_companyModel.dart';
import 'package:qr_attendence/provider/company/general_provider.dart';
// Replace with the actual path to your fetchEventattendence function

class ViewEventsAttendance extends StatefulWidget {
  final String eventId; // Pass the eventId when navigating to this screen

  const ViewEventsAttendance({Key? key, required this.eventId})
      : super(key: key);

  @override
  State<ViewEventsAttendance> createState() => _ViewEventsAttendanceState();
}

class _ViewEventsAttendanceState extends State<ViewEventsAttendance> {
  List<AttendanceRecordForCOmpany> attendanceList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAttendanceData();
  }

  Future<void> fetchAttendanceData() async {
    final response = await GeneralProvider().fetchEventattendence(
        widget.eventId); // Fetch data using the provided eventId
    if (response != null && response.success) {
      setState(() {
        attendanceList = response.attendanceRecords;
        isLoading = false;
      });
    } else {
      // Handle error or empty response
      setState(() {
        isLoading = false;
      });
      // Optionally, show an error message or an empty state
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(gradient: AppConstantsWidgetStyle.kgradientScreen),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Themecolor.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Event Attendance List',
              style: TextStyle(color: Themecolor.white)),
        ),
        body: isLoading
            ? Center(
                child:
                    CircularProgressIndicator()) // Show loading indicator while fetching data
            : attendanceList.isEmpty
                ? Center(
                    child: Text('No attendance records found',
                        style: TextStyle(color: Themecolor.white)))
                : ListView.builder(
                    itemCount: attendanceList.length,
                    itemBuilder: (context, index) {
                      AttendanceRecordForCOmpany attendanceEntry =
                          attendanceList[index];
                      return Padding(
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
                            title: Text(attendanceEntry
                                .employee.username), // Employee name
                            subtitle: Text(attendanceEntry
                                .event.eventName), // Attendance status
                            leading: CircleAvatar(
                              child: Text(attendanceEntry.employee
                                  .username[0]), // Initials of the employee
                            ),
                            trailing: (attendanceEntry.checkInTime != null &&
                                    attendanceEntry.checkOutTime != null)
                                ? const Text('Present',
                                    style: TextStyle(color: Colors.green))
                                : const Text('Absent',
                                    style: TextStyle(color: Colors.red)),
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
