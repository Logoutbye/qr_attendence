import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
import 'package:qr_attendence/core/components/reuseable_searchbar.dart';
import 'package:qr_attendence/data/model/fetch_all_event_model.dart';
import 'package:qr_attendence/provider/company/general_provider.dart';
import 'package:qr_attendence/view/screens/Host/events_details.dart';
import 'package:qr_attendence/view/screens/Host/total_employes.dart';

class ListOfCurrentEvent extends StatefulWidget {
  const ListOfCurrentEvent({super.key});

  @override
  State<ListOfCurrentEvent> createState() => _ListOfCurrentEventState();
}

class _ListOfCurrentEventState extends State<ListOfCurrentEvent> {
  Future<List<Event>>? fetchFilteredEvents;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchFilteredEvents = _fetchAndFilterEvents();
  }

  Future<List<Event>> _fetchAndFilterEvents() async {
    try {
      // Fetch all events
      final fetchAllEventModel =
          await GeneralProvider().FetchAllEvents(context);

      // Filter events
      final filteredEvents = filterUpcomingEvents(fetchAllEventModel);

      // Filter based on search query
      if (_searchController.text.isNotEmpty) {
        return filteredEvents
            .where((event) => event.eventName!
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()))
            .toList();
      }

      return filteredEvents;
    } catch (e) {
      // Handle exceptions
      if (kDebugMode)
        print("Error: Fetching and filtering events: ${e.toString()}");
      return [];
    }
  }

  List<Event> filterUpcomingEvents(FetchAllEventModel fetchAllEventModel) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    return fetchAllEventModel.events?.where((event) {
          final eventDate = event.date;
          if (eventDate == null) return false;

          final eventDay =
              DateTime(eventDate.year, eventDate.month, eventDate.day);
          return eventDay.isAtSameMomentAs(today) || eventDay.isAfter(today);
        }).toList() ??
        [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(gradient: AppConstantsWidgetStyle.kgradientScreen),
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
            'Current Events',
            style: TextStyle(
              fontSize: 18,
              color: Themecolor.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: ReUseAbleSearchWidgetWithFutureBuilder(
                onChanged: (query) {
                  if (query.isNotEmpty) {
                    // searchProvider.fetchAllAvailability();
                  }
                  setState(() {
                    fetchFilteredEvents = _fetchAndFilterEvents();
                  });
                },
                searchController: _searchController,
                width: MediaQuery.of(context).size.width * 0.9,
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Event>>(
                future: fetchFilteredEvents,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Event>> snapshot) {
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
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventsDetsils(
                                  event: event,
                                ),
                              ),
                            );
                          },
                          child: CurrentEvents(
                            eventname: event.eventName,
                            location: event.eventVenue,
                            date: event.date,
                            starttime: event.startTime ?? "",
                            endtime: event.endTime ?? '', event: event,
                            
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(
            gradient: AppConstantsWidgetStyle.kgradientButton,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.createEvent);
            },
            child: Icon(
              Icons.add,
              color: Themecolor.white,
              size: 35,
            ),
          ),
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
  final Event event;

  const CurrentEvents({
    Key? key,
    this.eventname,
    this.location,
    this.date,
    this.starttime,
    this.endtime,
    required this.event
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10),
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
        Divider(color: Colors.white),
        SizedBox(
          height: height * 0.01,
        ),
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
                        color: Themecolor.white,
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
                        color: Themecolor.white,
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
                        color: Themecolor.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Divider(color: Colors.white),
        Center(
          child: Container(
            margin: EdgeInsets.all(15),
            height: height * 0.06,
            width: width * 0.5,
            decoration: ShapeDecoration(
                // color: Themecolor.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                shadows: AppConstantsWidgetStyle.kShadows,
                color: Themecolor.primary),
            child: Center(
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EmployeeListScreen(showButton: true,event:event ,),
                        ),
                      );
                    },
                    child: Text(
                      'Add  Employee',
                      style: TextStyle(
                          color: Themecolor.white, fontWeight: FontWeight.bold),
                    ))),
          ),
        ),
      ]),
    );
  }
}
