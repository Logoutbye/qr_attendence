
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
import 'package:qr_attendence/core/components/reuseable_searchbar.dart';
import 'package:qr_attendence/data/model/fetch_all_employe_Attendece_byDate_model.dart';

class WeeklyAttendese extends StatefulWidget {
  final List<AttendanceRecord> attendanceRecords; // Attendance records for all dates
  final DateTime selectedDate; // Currently selected date (if needed)

  WeeklyAttendese({required this.attendanceRecords, required this.selectedDate});

  @override
  _WeeklyAttendeseState createState() => _WeeklyAttendeseState();
}

class _WeeklyAttendeseState extends State<WeeklyAttendese> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<DateTime> _dates;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
    _initializeDates();
  }

 
void _initializeDates() {
  DateTime now = DateTime.now();
  DateTime startDate = now.subtract(Duration(days: 7)); // 7 days before today
  _dates = List.generate(7, (index) => startDate.add(Duration(days: index)));
}

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(gradient: AppConstantsWidgetStyle.kgradientScreen),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Themecolor.white),
          ),
          title: Text('Weekly Attendance', style: TextStyle(color: Themecolor.white)),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: Container(
              height: height * 0.08,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Themecolor.primary),
              ),
              child: TabBar(
                controller: _tabController,
                tabs: _buildTabs(),
                isScrollable: true,
                indicatorColor: Themecolor.primary,
                labelPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                labelColor: Themecolor.white,
                unselectedLabelColor: Themecolor.whitehalf,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: AppConstantsWidgetStyle.kgradientButton,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: _buildDayContents(),
        ),
      ),
    );
  }

  List<Widget> _buildTabs() {
    
     List<DateTime> reversedDates = _dates.reversed.toList();
  
  return reversedDates.map((date) {
    String day = DateFormat('E').format(date);
    return Tab(
      text: '$day\n${DateFormat('d').format(date)}',
    );
  }).toList();
  }

  List<Widget> _buildDayContents() {
 
     List<DateTime> reversedDates = _dates.reversed.toList();
  
  return reversedDates.map((date) => _buildDayContent(date)).toList();
  }

  Widget _buildDayContent(DateTime date) {
    // Filter attendance records for the specific date
    final filteredRecords = widget.attendanceRecords.where((record) {
      return DateFormat('yyyy-MM-dd').format(record.checkInTime) == DateFormat('yyyy-MM-dd').format(date);
    }).toList();

     if (filteredRecords.isEmpty) {
    return Center(
      child: Text(
        'No attendees available for ${DateFormat('MMM d, yyyy').format(date)}',
        style: TextStyle(fontSize: 16, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: ReUseAbleSearchWidgetWithFutureBuilder(
            onChanged: (query) {
              // Update the search logic if needed
              setState(() {});
            },
            searchController: _searchController,
            width: MediaQuery.of(context).size.width * 0.9,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredRecords.length,
            itemBuilder: (context, index) {
              final record = filteredRecords[index];
              final String name=record.employee.username??'';
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
                        title: Text(name),
                        subtitle: Text('Attended on ${DateFormat('MMM d, yyyy').format(record.checkInTime)}'),
                        leading: Icon(Icons.person),
                        trailing: record.checkOutTime != null
                            ? Text('Present', style: TextStyle(color: Colors.green))
                            : const Text('Absent', style: TextStyle(color: Colors.red)),
                      ),
                    ),
                  ),
                  Divider(),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

