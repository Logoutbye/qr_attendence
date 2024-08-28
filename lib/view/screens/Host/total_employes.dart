import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
import 'package:qr_attendence/data/model/fetch_all_event_model.dart';
import 'package:qr_attendence/data/model/total_employe_model.dart';
import 'package:qr_attendence/provider/company/total_employee_provider.dart';

class EmployeeListScreen extends StatefulWidget {
  final bool showButton;
  final Event? event;

  EmployeeListScreen({this.showButton = false,this.event});
  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  Future<TotalEmploye>? allEmployee;
  Map<int, bool> checkedItems = {};
  bool isAllSelected = false;

  @override
  void initState() {
    allEmployee = EmployeeProvider().fetchAllEmplyee(context);
    super.initState();
  }

  void toggleSelectAll(BuildContext context, EmployeeProvider employeeProvider) async {
  final employeeCount = await employeeProvider.fetchAllEmplyee(context)
      .then((data) => data.employees!.length)
      .catchError((_) => 0);

  setState(() {
    isAllSelected = !isAllSelected;
    for (int i = 0; i < employeeCount; i++) {
      checkedItems[i] = isAllSelected;
    }
  });
}

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // // final employeeProvider = Provider.of<EmployeeProvider>(context);
        final employeeProvider = Provider.of<EmployeeProvider>(context);


    return Container(
      decoration:
          BoxDecoration(gradient: AppConstantsWidgetStyle.kgradientScreen),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Themecolor.white,
              )),
          title: const Text(
            'Employee List',
            style:
                TextStyle(color: Themecolor.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          // margin: EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Themecolor.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            boxShadow: AppConstantsWidgetStyle.kShadows,
          ),
          child: Consumer<EmployeeProvider>(
            builder: (BuildContext context, EmployeeProvider, Widget? child) { 
        return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Employees',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Themecolor.primary,
                      ),
                    ),
                    widget.showButton
                        ? GestureDetector(
                          onTap: (){
                           toggleSelectAll(context,EmployeeProvider);
                               
                          },
                          child: Container(
                              margin: EdgeInsets.only(right: 10),
                              height: height * 0.04,
                              width: width * 0.23,
                              decoration: ShapeDecoration(
                                  color: Themecolor.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  shadows: AppConstantsWidgetStyle.kShadows),
                              child: Center(
                                  child: Text(
                                "Select all",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))),
                        )
                        : SizedBox(),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: FutureBuilder<TotalEmploye>(
                    future: allEmployee,
                    builder: (BuildContext context,
                        AsyncSnapshot<TotalEmploye> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
            
                      if (snapshot.data == null) {
                        return Center(
                          child: Text('No data available'),
                        );
                      }
                      final totalemployees = snapshot.data?.employees;
            
                      return ListView.builder(
                        itemCount: totalemployees?.length,
                        itemBuilder: (context, index) {
                          final totalEmploye = totalemployees?[index];
                          final name = totalEmploye?.username ?? '';

                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ListTile(
                              title: Text(name),
                              leading: const Icon(Icons.person),
                              trailing: widget.showButton
                                  ? Checkbox(
                                      checkColor: Themecolor.black,
                                      fillColor: WidgetStateProperty.all(
                                          Themecolor.whitehalf),
                                      value: checkedItems[index] ?? false,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          checkedItems[index] = value!;
                                        });
                                      },
                                    )
                                  : Icon(Icons.arrow_forward_ios),
                              onTap: () {},
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                widget.showButton
                    ? Center(
                        child: Container(
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
                                  onTap: ()async {
                                    List<String> selectedEmployeeIds = [];
                                  final totalEmployees = await employeeProvider.fetchAllEmplyee(context);
                                  final employees = totalEmployees.employees;

                                  for (int i = 0; i < (employees?.length ?? 0); i++) {
                                    if (checkedItems[i] == true) {
                                      selectedEmployeeIds.add(employees?[i].id ?? '');
                                    }
                                  }

                                  if (selectedEmployeeIds.isNotEmpty) {
                                    await employeeProvider.addEmployeesToEvent(selectedEmployeeIds, widget.event?.id?? '',context);
                                  } else {
                                    print('No employees selected');
                                  }
                                  },
                                  child: const Text(
                                    'Add  Employee',
                                    style: TextStyle(
                                        color: Themecolor.white,
                                        fontWeight: FontWeight.bold),
                                  ))),
                        ),
                      )
                    : SizedBox(),
              ],
            );
     
             },
         ),
        ),
      ),
    );
  }
}
