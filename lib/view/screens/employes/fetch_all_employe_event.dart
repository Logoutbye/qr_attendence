// // import 'package:flutter/material.dart';
// // import 'package:qr_attendence/config/theme/theme.dart';
// // import 'package:qr_attendence/core/components/app_constant_widget_style.dart';

// // class FetchAllEventForEmploye extends StatefulWidget {
// //   const FetchAllEventForEmploye({super.key});

// //   @override
// //   State<FetchAllEventForEmploye> createState() => _FetchAllEventForEmployeState();
// // }

// // class _FetchAllEventForEmployeState extends State<FetchAllEventForEmploye> with SingleTickerProviderStateMixin {
// //   late TabController _tabController;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _tabController = TabController(length: 2, vsync: this);
// //   }

// //   @override
// //   void dispose() {
// //     _tabController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final height=MediaQuery.of(context).size.height;
// //         final width=MediaQuery.of(context).size.width;

// //     return Container(
// //       decoration: BoxDecoration(
// //          gradient: LinearGradient(
// //           // colors: [
// //           //   Themecolor.primary,
// //           //   const Color.fromRGBO(187, 222, 251, 1),
// //           // ],
// //           colors: [Color(0xff02387E), Color(0xff01C4EF)],
// //           begin: Alignment.topLeft,
// //           end: Alignment.bottomRight,
// //         ),

// //       ),

// //       child: Scaffold(
// //         backgroundColor: Colors.transparent,
// //         appBar: AppBar(
// //           leading: IconButton(onPressed: (){
// //             Navigator.pop(context);
// //           }, icon: Icon(Icons.arrow_back,color: Themecolor.white,)),
// //           title: Text('Employee Events',style: TextStyle(color: Themecolor.white),),
// //           bottom: PreferredSize(
// //            preferredSize: Size.fromHeight(kToolbarHeight),
// //             child: Container(
// //                 height: height * 0.06,
// //                 decoration: BoxDecoration(
// //                     color: Colors.grey.withOpacity(0.2),
// //                     borderRadius: BorderRadius.circular(15),
// //                     border: Border.all(color: Themecolor.primary)),
// //               child: TabBar(
// //                 isScrollable: true,
// //                   indicatorColor: Themecolor.primary,
// //                   labelPadding:
// //                       EdgeInsets.symmetric(horizontal: 40, vertical: 10),
// //                 controller: _tabController,
// //                 tabs: const [
// //                   Tab(text: 'Upcoming Events'),
// //                   Tab(text: 'Attended Events'),

// //                 ],
// //                 labelColor:
// //                       Themecolor.white, // Customize the selected tab label color
// //                   unselectedLabelColor: Themecolor
// //                       .black, // Customize the unselected tab label color
// //                   indicator: BoxDecoration(
// //                       borderRadius: BorderRadius.all(Radius.circular(10)),
// //                       gradient: AppConstantsWidgetStyle
// //                           .kgradientButton // Change this color as needed
// //                       ),
// //                   // labelStyle: TextStyle(color: Themecolor.orange),
// //                   // unselectedLabelStyle: TextStyle(color: Themecolor.orange),

// //                   indicatorSize: TabBarIndicatorSize.tab,
// //               ),
// //             ),
// //           ),
// //         ),
// //         body: Container(
// //           decoration: BoxDecoration(
// //             color: Themecolor.white,
// //             borderRadius: BorderRadius.all(Radius.circular(30))
// //           ),
// //           child: TabBarView(
// //             controller: _tabController,
// //             children: const [
// //               UpcomingEventsTab(), // This widget will display upcoming events
// //               AttendedEventsTab(), // This widget will display attended events
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class UpcomingEventsTab extends StatelessWidget {
// //   const UpcomingEventsTab({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     // Replace with your own data and logic
// //     final upcomingEvents = ['Event 1', 'Event 2', 'Event 3']; // Example data

// //     return ListView.builder(
// //       itemCount: upcomingEvents.length,
// //       itemBuilder: (context, index) {
// //         return Column(
// //           children: [
// //                Padding(
// //                           padding: const EdgeInsets.all(8.0),
// //                           child: Container(
// //                             margin: EdgeInsets.all(5),
// //                             decoration: ShapeDecoration(
// //                               color: Themecolor.white,
// //                               shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(15),
// //                               ),
// //                               shadows: AppConstantsWidgetStyle.kShadows,
// //                             ),
// //                             child: ListTile(
// //                               title: Text(attendanceRecord.employee),
// //                               subtitle: Text('Attended on ${DateFormat('MMM d, yyyy').format(date)}'),
// //                               leading: Icon(Icons.person),
// //                               trailing: attendanceRecord.checkOutTime != null
// //                                   ? Text('Present', style: TextStyle(color: Colors.green))
// //                                   : Text('Absent', style: TextStyle(color: Colors.red)),
// //                             ),
// //                           ),
// //                         ),
// //                         Divider(),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }

// // class AttendedEventsTab extends StatelessWidget {
// //   const AttendedEventsTab({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     // Replace with your own data and logic
// //     final attendedEvents = ['Event A', 'Event B']; // Example data

// //     return ListView.builder(
// //       itemCount: attendedEvents.length,
// //       itemBuilder: (context, index) {
// //         return Column(
// //           children: [
// //               Padding(
// //                           padding: const EdgeInsets.all(8.0),
// //                           child: Container(
// //                             margin: EdgeInsets.all(5),
// //                             decoration: ShapeDecoration(
// //                               color: Themecolor.white,
// //                               shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(15),
// //                               ),
// //                               shadows: AppConstantsWidgetStyle.kShadows,
// //                             ),
// //                             child: ListTile(
// //                               title: Text(attendanceRecord.employee),
// //                               subtitle: Text('Attended on ${DateFormat('MMM d, yyyy').format(date)}'),
// //                               leading: Icon(Icons.person),
// //                               trailing: attendanceRecord.checkOutTime != null
// //                                   ? Text('Present', style: TextStyle(color: Colors.green))
// //                                   : Text('Absent', style: TextStyle(color: Colors.red)),
// //                             ),
// //                           ),
// //                         ),
// //                         Divider(),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:qr_attendence/config/routes/routes_name.dart';
// import 'package:qr_attendence/config/theme/theme.dart';
// import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
// import 'package:intl/intl.dart';
// import 'package:qr_attendence/view/screens/employes/employes_checkin.dart'; // Import for date formatting

// class FetchAllEventForEmploye extends StatefulWidget {
//   const FetchAllEventForEmploye({super.key});

//   @override
//   State<FetchAllEventForEmploye> createState() =>
//       _FetchAllEventForEmployeState();
// }

// class _FetchAllEventForEmployeState extends State<FetchAllEventForEmploye>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;

//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xff02387E), Color(0xff01C4EF)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.arrow_back, color: Themecolor.white),
//           ),
//           title: const Text(
//             'Employee Events',
//             style: TextStyle(color: Themecolor.white),
//           ),
//         ),
//         body: Container(
//           decoration: const BoxDecoration(
//             color: Themecolor.white,
//             borderRadius: BorderRadius.all(Radius.circular(30)),
//           ),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: height * 0.02,
//               ),
//               Container(
//                 height: height * 0.06,
//                 // margin: const EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: Colors.grey.withOpacity(0.2),
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(color: Themecolor.primary),
//                 ),
//                 child: TabBar(
//                   isScrollable: true,
//                   indicatorColor: Themecolor.primary,
//                   labelPadding:
//                       const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//                   controller: _tabController,
//                   tabs: const [
//                     Tab(text: 'Upcoming Events'),
//                     Tab(text: 'Attended Events'),
//                   ],
//                   labelColor: Themecolor.white,
//                   unselectedLabelColor: Themecolor.black,
//                   indicator: BoxDecoration(
//                     borderRadius: const BorderRadius.all(Radius.circular(10)),
//                     gradient: AppConstantsWidgetStyle.kgradientButton,
//                   ),
//                   indicatorSize: TabBarIndicatorSize.tab,
//                 ),
//               ),
//               Expanded(
//                 child: TabBarView(
//                   controller: _tabController,
//                   children: const [
//                     UpcomingEventsTab(),
//                     AttendedEventsTab(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class UpcomingEventsTab extends StatelessWidget {
//   const UpcomingEventsTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final upcomingEvents = ['Event 1', 'Event 2', 'Event 3']; // Example data

//     return ListView.builder(
//       itemCount: upcomingEvents.length,
//       itemBuilder: (context, index) {
//         final upcomingevents=upcomingEvents[index];
//         return Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 margin: const EdgeInsets.all(5),
//                 decoration: ShapeDecoration(
//                   color: Themecolor.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   shadows: AppConstantsWidgetStyle.kShadows,
//                 ),
//                 child: ListTile(
//                   onTap: (){
//      Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => Employescheckin(eventsname: upcomingevents,isevent: true,),
//                   ),
//                 );
//                   },
//                   title: Text(upcomingEvents[index]),
//                   subtitle: Text(
//                       'Event Date: ${DateFormat('MMM d, yyyy').format(DateTime.now().add(Duration(days: index)))}'),
//                   leading: const Icon(Icons.event),
//                 ),
//               ),
//             ),
//             const Divider(),
//           ],
//         );
//       },
//     );
//   }
// }

// class AttendedEventsTab extends StatelessWidget {
//   const AttendedEventsTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final attendedEvents = ['Event A', 'Event B']; // Example data

//     return ListView.builder(
//       itemCount: attendedEvents.length,
//       itemBuilder: (context, index) {
//         return Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 margin: const EdgeInsets.all(5),
//                 decoration: ShapeDecoration(
//                   color: Themecolor.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   shadows: AppConstantsWidgetStyle.kShadows,
//                 ),
//                 child: ListTile(
//                   title: Text(attendedEvents[index]),
//                   subtitle: Text(
//                       'Attended on ${DateFormat('MMM d, yyyy').format(DateTime.now().subtract(Duration(days: index)))}'),
//                   leading: const Icon(Icons.event_available),
//                 ),
//               ),
//             ),
//             const Divider(),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
import 'package:qr_attendence/data/model/fetch_all_events_for_employee_model.dart';

import 'package:qr_attendence/provider/company/general_provider.dart';
import 'package:qr_attendence/view/screens/employes/employes_checkin.dart'; // Import for date formatting

class FetchAllEventForEmploye extends StatefulWidget {
  const FetchAllEventForEmploye({super.key});

  @override
  State<FetchAllEventForEmploye> createState() =>
      _FetchAllEventForEmployeState();
}

class _FetchAllEventForEmployeState extends State<FetchAllEventForEmploye>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Future<FetchallEmployeeEvents> _fetchallEmployeeEvents;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _fetchallEmployeeEvents = fetchEmployeeEvents(); // Fetch data on init
  }

  Future<FetchallEmployeeEvents> fetchEmployeeEvents() async {
    return await GeneralProvider()
        .FetchAllEventsForEmployee(context); // Fetch data
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return FutureBuilder<FetchallEmployeeEvents>(
      future: _fetchallEmployeeEvents,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData) {
          return const Center(child: Text('No data available'));
        }

        final employeeEvents = snapshot.data!;
        List<Current> attendedEvents = employeeEvents.data.attendances
                .where((attendance) =>
                    attendance.checkInTime != null &&
                    attendance.checkOutTime != null)
                .map((attendance) => attendance.event)
                .toList() ??
            [];

        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff02387E), Color(0xff01C4EF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Themecolor.white),
              ),
              title: const Text(
                'Employee Events',
                style: TextStyle(color: Themecolor.white),
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                color: Themecolor.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Column(
                children: [
                  SizedBox(height: height * 0.02),
                  Container(
                    height: height * 0.06,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Themecolor.primary),
                    ),
                    child: TabBar(
                      isScrollable: true,
                      indicatorColor: Themecolor.primary,
                      labelPadding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      controller: _tabController,
                      tabs: const [
                        Tab(text: 'Upcoming Events'),
                        Tab(text: 'Attended Events'),
                        Tab(text: 'Prevoius Events'),
                      ],
                      labelColor: Themecolor.white,
                      unselectedLabelColor: Themecolor.black,
                      indicator: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        gradient: AppConstantsWidgetStyle.kgradientButton,
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        UpcomingEventsTab(events: employeeEvents.data.current),
                        AttendedEventsTab(
                          events: attendedEvents,
                        ),
                        prevousEventsTab(events: employeeEvents.data.previous)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class UpcomingEventsTab extends StatelessWidget {
  final List<Current> events; // Accept list of events

  const UpcomingEventsTab({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: ShapeDecoration(
                  color: Themecolor.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: AppConstantsWidgetStyle.kShadows,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Employescheckin(
                            eventsname: event.eventName, isevent: true),
                      ),
                    );
                  },
                  title: Text(event.eventName),
                  subtitle: Text(
                      'Event Date: ${DateFormat('MMM d, yyyy').format(event.date)}'),
                  leading: const Icon(Icons.event),
                ),
              ),
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}

class AttendedEventsTab extends StatelessWidget {
  final List<Current> events; // Accept list of events

  const AttendedEventsTab({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: ShapeDecoration(
                  color: Themecolor.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: AppConstantsWidgetStyle.kShadows,
                ),
                child: ListTile(
                  title: Text(event.eventName),
                  subtitle: Text(
                      'Attended on ${DateFormat('MMM d, yyyy').format(event.date)}'),
                  leading: const Icon(Icons.event_available),
                ),
              ),
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}

class prevousEventsTab extends StatelessWidget {
  final List<Current> events; // Accept list of events

  const prevousEventsTab({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: ShapeDecoration(
                  color: Themecolor.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: AppConstantsWidgetStyle.kShadows,
                ),
                child: ListTile(
                  title: Text(event.eventName),
                  subtitle: Text(
                      'Attended on ${DateFormat('MMM d, yyyy').format(event.date)}'),
                  leading: const Icon(Icons.event_available),
                ),
              ),
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}
