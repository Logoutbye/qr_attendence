import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
import 'package:qr_attendence/core/components/reuseable_searchbar.dart'; // Import for date formatting

class WeeklyAttendese extends StatefulWidget {
  @override
  _WeeklyAttendeseState createState() => _WeeklyAttendeseState();
}

class _WeeklyAttendeseState extends State<WeeklyAttendese>
    with SingleTickerProviderStateMixin {
      bool ispresent=true;
  late TabController _tabController;
  late List<DateTime> _dates; 
  TextEditingController _searchController=TextEditingController();// List to store dates for each day

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
    _initializeDates();
  }

  // Function to initialize dates for each day of the week
  void _initializeDates() {
    DateTime now = DateTime.now();
    DateTime startDate = now.subtract(Duration(days: now.weekday - 1));
    _dates = List.generate(7, (index) => startDate.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Attendance'),
        bottom: TabBar(
          controller: _tabController,
          tabs: _buildTabs(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _buildDayContents(),
      ),
    );
  }

  // Function to build tabs for each day
  List<Widget> _buildTabs() {
    return _dates.map((date) {
      String day = DateFormat('E').format(date);
      return Tab(text: '$day\n${DateFormat('d').format(date)}');
    }).toList();
  }

  // Function to build content for each day
  List<Widget> _buildDayContents() {
    return _dates.map((date) => _buildDayContent(date)).toList();
  }

  // Function to build content for a specific day
  Widget _buildDayContent(DateTime date) {
    // Dummy data for employees
    final employees = List.generate(10, (index) => 'Employee ${index + 1}');
   

    return Column(
      children: [
        //hare i want to build search bar
          Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: ReUseAbleSearchWidgetWithFutureBuilder(
            onChanged: (query) {
              if (query.isNotEmpty) {
                // searchProvider.fetchAllAvailability();
              }
              setState(() {
                
              });
            },
            searchController: _searchController,
            width: MediaQuery.of(context).size.width*0.9,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: employees.length,
            itemBuilder: (context, index) {
              final employee = employees[index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration:ShapeDecoration(
                              color: Themecolor.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              shadows: AppConstantsWidgetStyle.kShadows),
                      child: ListTile(
                        title: Text(employee),
                        subtitle: Text('Attended on ${DateFormat('MMM d, yyyy').format(date)}'),
                        leading: Icon(Icons.person),
                        trailing: ispresent ? Text('Present'):Text("Absent"),
                      ),
                    ),
                  ),
                  // SizedBox(height: MediaQuery.of(context).size.height*0.01),
                  Divider()
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
