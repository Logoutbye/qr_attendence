import 'package:flutter/material.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';

class PreviousEvent extends StatefulWidget {
  const PreviousEvent({super.key});

  @override
  State<PreviousEvent> createState() => _PreviousEventState();
}

class _PreviousEventState extends State<PreviousEvent> {
  List<Modelclass> listOfCurrentEvent = [
    Modelclass('Coding Mentor', 'ItPark', '17/23/12', '4:03', '5:45'),
    Modelclass('Coding Mentor', 'ItPark', '17/23/12', '4:03', '5:45'),
    Modelclass('Coding Mentor', 'ItPark', '17/23/12', '4:03', '5:45'),
    Modelclass('Coding Mentor', 'ItPark', '17/23/12', '4:03', '5:45'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration:  BoxDecoration(
        gradient: AppConstantsWidgetStyle.kgradientScreen
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Themecolor.white,
              )),
          title: Text(
            'Previous Event',
            style: TextStyle(
                fontSize: 18,
                color: Themecolor.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(
            top: 50,
          ),
          padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              color: Themecolor.whitehalf,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: ListView.builder(
            itemCount: listOfCurrentEvent.length,
            itemBuilder: (BuildContext context, index) {
              final event = listOfCurrentEvent[index];
              return CurrentEvents(
                eventname: event.eventname,
                location: event.location,
                date: event.date,
                starttime: event.starttime,
                endtime: event.endtime,
              );
            },
          ),
        ),
   ),
    );
  }
}

class Modelclass {
  final String? eventname;
  final String? location;
  final String? date;
  final String? starttime;
  final String? endtime;

  Modelclass(
      this.eventname, this.location, this.date, this.starttime, this.endtime);
}

class CurrentEvents extends StatelessWidget {
  final String? eventname;
  final String? location;
  final String? date;
  final String? starttime;
  final String? endtime;

  const CurrentEvents({
    Key? key,
    this.eventname,
    this.location,
    this.date,
    this.starttime,
    this.endtime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        gradient: AppConstantsWidgetStyle.kgradientScreen,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: [
          //     Themecolor.primary,
          //     Colors.white,
          //   ],
          // ),
          color: Themecolor.whitehalf),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventname ?? 'Event Name',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Text(
                  location ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        Divider(color: Colors.black),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Date: ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: date ?? '',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Themecolor.white, // Example color for date
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Start Time: ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: starttime ?? '',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Themecolor.white, // Example color for start time
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'End Time: ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: endtime ?? '',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Themecolor.white, // Example color for end time
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
