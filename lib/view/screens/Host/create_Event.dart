import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
import 'package:qr_attendence/provider/create_event_provider.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});
  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final eventProvider = Provider.of<EventProvider>(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // colors: [
          //   Themecolor.primary,
          //   const Color.fromRGBO(187, 222, 251, 1),
          // ],
          colors: [Color(0xff02387E), Color(0xff01C4EF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        //  static const Color primary = Color(0xFF03008B);
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Themecolor.white,
              )),
          title: Text(
            'Create Event',
            style: TextStyle(color: Themecolor.white),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(
            top: 50,
          ),
          padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              color: Themecolor.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: eventProvider.formKey,
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    height: height * 0.48,
                    width: double.infinity,
                    decoration: ShapeDecoration(
                        color: Themecolor.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        shadows: AppConstantsWidgetStyle.kShadows),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: eventProvider.eventNameController,
                          decoration: InputDecoration(
                            hintText: 'Enter event name',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF177DD1), width: 2.0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter event name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        TextFormField(
                          controller: eventProvider.eventVenueController,
                          decoration: InputDecoration(
                            hintText: 'Enter venue',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF177DD1), width: 2.0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter event venue';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Divider(
                          color: Themecolor.primary,
                        ),
                        Container(
                          height: height * 0.07,
                          width: double.infinity,
                          decoration: ShapeDecoration(
                              color: Themecolor.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              shadows: AppConstantsWidgetStyle.kShadows),
                          child: ListTile(
                            title: Text(
                                "Event Date: ${eventProvider.eventDate != null ? eventProvider.eventDate.toString().split(' ')[0] : 'Select Date'}"),
                            trailing: Icon(
                              Icons.calendar_month_rounded,
                              color: Themecolor.primary,
                            ),
                            onTap: () => eventProvider.selectDate(context),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          height: height * 0.07,
                          width: double.infinity,
                          decoration: ShapeDecoration(
                              color: Themecolor.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              shadows: AppConstantsWidgetStyle.kShadows),
                          child: ListTile(
                            title: Text(
                                "Start Time: ${eventProvider.startTime != null ? eventProvider.startTime!.format(context) : 'Select Start Time'}"),
                            trailing: Icon(
                              Icons.access_time,
                              color: Themecolor.primary,
                            ),
                            onTap: () =>
                                eventProvider.selectTime(context, true),
                          ),
                        ),
               SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                              height: height * 0.07,
                          width: double.infinity,
                          decoration: ShapeDecoration(
                              color: Themecolor.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              shadows: AppConstantsWidgetStyle.kShadows),

                          child: ListTile(
                            title: Text(
                                "End Time: ${eventProvider.endTime != null ? eventProvider.endTime!.format(context) : 'Select End Time'}"),
                            trailing: Icon(
                              Icons.access_time,
                              color: Themecolor.primary,
                            ),
                            onTap: () => eventProvider.selectTime(context, false),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // TextFormField(
                  //   decoration: InputDecoration(labelText: 'Add Participant'),
                  //   onFieldSubmitted: (value) {
                  //     if (value.isNotEmpty) {
                  //       eventProvider.addParticipant(value);
                  //     }
                  //   },
                  // ),
                  // Wrap(
                  //   children: eventProvider.participants
                  //       .map((participant) => Chip(
                  //             label: Text(participant),
                  //             onDeleted: () => eventProvider.removeParticipant(participant),
                  //           ))
                  //       .toList(),
                  // ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
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
                      'Create Event',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     eventProvider.saveEvent();
                  //     Navigator.pushNamed(
                  //       context,
                  //       RoutesName.createPeople,
                  //     );
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     minimumSize: Size(double.infinity, 48), backgroundColor: Colors.transparent,
                  //     shadowColor: Colors.transparent,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //   ),
                  //   child: Text('Create Event', style: TextStyle(color: Colors.white)),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
