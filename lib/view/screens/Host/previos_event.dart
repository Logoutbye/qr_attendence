import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
import 'package:qr_attendence/data/model/fetch_all_event_model.dart';
import 'package:qr_attendence/provider/company/general_provider.dart';

class PreviousEvent extends StatefulWidget {
  const PreviousEvent({super.key});

  @override
  State<PreviousEvent> createState() => _PreviousEventState();
}

class _PreviousEventState extends State<PreviousEvent> {
  Future<List<Event>>? fetchPreviousFilteredEvents;

  @override
  void initState() {
    super.initState();
    fetchPreviousFilteredEvents = _fetchAndFilterEvents();
  }

  Future<List<Event>> _fetchAndFilterEvents() async {
    try {
      // Fetch all events
      final fetchAllEventModel = await GeneralProvider().FetchAllEvents(context);

      // Filter events
      final filteredEvents = filterPreviousEvents(fetchAllEventModel);

      return filteredEvents;
    } catch (e) {
      // Handle exceptions
      if (kDebugMode) print("Error: Fetching and filtering events: ${e.toString()}");
      return [];
    }
  }

  List<Event> filterPreviousEvents(FetchAllEventModel fetchAllEventModel) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day); // Midnight of today
    return fetchAllEventModel.events?.where((event) {
      return event.date != null && event.date!.isBefore(today);
    }).toList() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppConstantsWidgetStyle.kgradientScreen,
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
            ),
          ),
          title: Text(
            'Previous Event',
            style: TextStyle(
              fontSize: 18,
              color: Themecolor.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: FutureBuilder<List<Event>>(
          future: fetchPreviousFilteredEvents,
          builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return Center(
                child: Text('No data available'),
              );
            }

            final filteredEvents = snapshot.data!;
            return Container(
              margin: EdgeInsets.only(
                top: 50,
              ),
              padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Themecolor.whitehalf,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView.builder(
                itemCount: filteredEvents.length,
                itemBuilder: (BuildContext context, int index) {
                  final event = filteredEvents[index];
                  return CurrentEvents(
                    eventname: event.eventName,
                    location: event.eventVenue,
                    date: event.date,
                    starttime: event.startTime ?? "",
                    endtime: event.endTime ?? '',
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class CurrentEvents extends StatelessWidget {
  final String? eventname;
  final String? location;
  final DateTime? date;
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
        color: Themecolor.whitehalf,
      ),
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
                    const TextSpan(
                      text: 'Date: ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: date != null
                          ? '${date!.toLocal().toString().split(' ')[0]}'
                          : 'N/A',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
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
                    const TextSpan(
                      text: 'Start Time: ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: starttime ?? '',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
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
                    const TextSpan(
                      text: 'End Time: ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: endtime ?? '',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
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
