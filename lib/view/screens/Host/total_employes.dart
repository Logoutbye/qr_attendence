import 'package:flutter/material.dart';

import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
import 'package:qr_attendence/data/model/total_employe_model.dart';
import 'package:qr_attendence/provider/company/total_employee_provider.dart';

class EmployeeListScreen extends StatefulWidget {
  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  Future<TotalEmploye>? allEmployee;

  @override
  void initState() {
    allEmployee = EmployeeProvider().fetchAllEmplyee(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final employeeProvider = Provider.of<EmployeeProvider>(context);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Employees',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Themecolor.primary,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: FutureBuilder<TotalEmploye>(
                  future: allEmployee,
                  builder:
                      (BuildContext context, AsyncSnapshot<TotalEmploye> snapshot) {
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
               final     totalemployees=snapshot.data?.employees;
              
                    return ListView.builder(
                      itemCount: totalemployees?.length,
                      itemBuilder: (context, index) {
                        final totalEmploye=totalemployees?[index];
                        final name=totalEmploye?.username??'';
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
                            title:  Text(name),
                            leading: const Icon(Icons.person),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
