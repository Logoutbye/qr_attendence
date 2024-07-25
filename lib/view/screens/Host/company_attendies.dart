import 'package:flutter/material.dart';

class CompanyAttendies extends StatefulWidget {
  const CompanyAttendies({super.key});

  @override
  State<CompanyAttendies> createState() => _CompanyAttendiesState();
}

class _CompanyAttendiesState extends State<CompanyAttendies> {
  DateTime _selectedDate = DateTime.now();
  List<AttendanceRecord> _dailyAttendance = [];
  List<AttendanceRecord> _weeklyAttendance = [];

  @override
  void initState() {
    super.initState();
    _fetchDummyData();
  }

  void _fetchDummyData() {
    _dailyAttendance = List.generate(10, (index) {
      return AttendanceRecord(
        employeeName: 'Employee $index',
        attendanceDetail: 'Present',
      );
    });
    _weeklyAttendance = List.generate(10, (index) {
      return AttendanceRecord(
        employeeName: 'Employee $index',
        attendanceDetail: 'Present',
      );
    });
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // For now, we use the same dummy data, you can later replace it with your API call.
      });
    }
  }

  Widget _buildDailyAttendance() {
    return ListView.builder(
      itemCount: _dailyAttendance.length,
      itemBuilder: (context, index) {
        final record = _dailyAttendance[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildAttendanceItem(record),
        );
      },
    );
  }

  Widget _buildWeeklyAttendance() {
    return ListView.builder(
      itemCount: _weeklyAttendance.length,
      itemBuilder: (context, index) {
        final record = _weeklyAttendance[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildAttendanceItem(record),
        );
      },
    );
  }

  Widget buildAttendanceItem(AttendanceRecord record) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Employee Name: ${record.employeeName}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Attendance: ${record.attendanceDetail}'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: Text('Select Date: ${_selectedDate.toLocal()}'.split(' ')[0]),
              ),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      height: 400,
                      child: _buildWeeklyAttendance(),
                    ),
                  );
                },
                child: Text('Weekly'),
              ),
            ],
          ),
          Expanded(
            child: _buildDailyAttendance(),
          ),
        ],
      ),
    );
  }
}

class AttendanceRecord {
  final String employeeName;
  final String attendanceDetail;

  AttendanceRecord({
    required this.employeeName,
    required this.attendanceDetail,
  });
}
