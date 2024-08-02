import 'package:flutter/material.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
import 'package:qr_attendence/core/utilis/drawer.dart';
import 'package:qr_attendence/data/model/all_length_model.dart';
import 'package:qr_attendence/provider/company/general_provider.dart';
import 'package:qr_attendence/view/screens/Host/company_attendies.dart';
import 'package:qr_attendence/view/screens/Host/create_Event.dart';

class DashBoardHost extends StatefulWidget {
  const DashBoardHost({Key? key}) : super(key: key);

  @override
  State<DashBoardHost> createState() => _DashBoardHostState();
}

class _DashBoardHostState extends State<DashBoardHost> {
  Future<AllLength>? allLengthforCompany;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    allLengthforCompany = GeneralProvider().fetchAllLength(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<ModelClass> titles = [
    ModelClass(title: 'Current Event', numbers: 3),
    ModelClass(title: 'Previous Event', numbers: 9),
    ModelClass(title: 'Create Event'),
    ModelClass(title: "Total Employ", numbers: 8)
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        drawer: CompanyDrawerWidget(
          height: height * 0.9,
        ),
        backgroundColor: Themecolor.whitehalf,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Themecolor.primary,
                  Themecolor.primaryLight,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: AppBar(
              backgroundColor:
                  Colors.transparent, // Make AppBar background transparent
              elevation: 0, // Remove shadow
              title: const Text(
                'Dashboard',
                style: TextStyle(color: Themecolor.white),
              ),
              // Any other AppBar properties you want
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              // margin: const EdgeInsets.symmetric(horizontal: 8),
              height: height * 0.06,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Themecolor.primary)),
              child: TabBar(
                isScrollable: true,
                indicatorColor: Themecolor.primary,
                labelPadding:
                    EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                tabs: [
                  Tab(text: 'Events'),
                  Tab(text: 'Company'),
                ],
                // Customize the tab indicator color
                labelColor:
                    Themecolor.white, // Customize the selected tab label color
                unselectedLabelColor: Themecolor
                    .black, // Customize the unselected tab label color
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: AppConstantsWidgetStyle
                        .kgradientButton // Change this color as needed
                    ),
                // labelStyle: TextStyle(color: Themecolor.orange),
                // unselectedLabelStyle: TextStyle(color: Themecolor.orange),

                indicatorSize: TabBarIndicatorSize.tab,
                // Set the size of the indicator
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // First Tab: Events
                  FutureBuilder<AllLength>(
                    future: allLengthforCompany,
                    builder: (BuildContext context,
                        AsyncSnapshot<AllLength> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      }

                      if (!snapshot.hasData) {
                        return Center(
                          child: Text('No data available'),
                        );
                      }
                      final allLength = snapshot.data!;
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(15),
                              padding: EdgeInsets.only(top: 15),
                              height: height * 0.5,
                              width: double.infinity,
                              decoration: ShapeDecoration(
                                  color: Themecolor.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  shadows: AppConstantsWidgetStyle.kShadows),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GridView.builder(
                                  physics:
                                      NeverScrollableScrollPhysics(), // Prevent GridView from scrolling
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, // Number of columns
                                    crossAxisSpacing:
                                        8.0, // Spacing between columns
                                    mainAxisSpacing:
                                        8.0, // Spacing between rows
                                  ),
                                  itemCount: titles
                                      .length, // Number of items in the grid
                                  itemBuilder: (context, index) {
                                    final lists = titles[index];
                                    final text1 = lists.title ?? '';
                                    final count = lists.numbers ?? 0;
                                    return GestureDetector(
                                      onTap: () {
                                        if (text1 == 'Current Event') {
                                          Navigator.pushNamed(context,
                                              RoutesName.listOfCurrentEvent);
                                        } else if (text1 == 'Previous Event') {
                                          Navigator.pushNamed(context,
                                              RoutesName.listOfPreviousEvent);
                                        } else if (text1 == 'Create Event') {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CreateEventScreen(),
                                            ),
                                          );
                                        } else if (text1 == 'Total Employ') {
                                          Navigator.pushNamed(
                                              context, RoutesName.totalEmploy);
                                        }
                                      },
                                      child: Card(
                                        color: Themecolor.white,
                                        elevation: 8,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15, left: 6),
                                                child: text1 != 'Create Event'
                                                    ? Container(
                                                        margin: EdgeInsets.only(
                                                            right: 10),
                                                        height: height * 0.04,
                                                        width: width * 0.28,
                                                        decoration: ShapeDecoration(
                                                            color: Themecolor
                                                                .white,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            shadows:
                                                                AppConstantsWidgetStyle
                                                                    .kShadows),
                                                        child: Center(
                                                          child: Text(
                                                            // text1 != 'Create Event'
                                                            //     ? 'Total Events: $count'
                                                            //     : '',
                                                            (text1 != 'Create Event' &&
                                                                    text1 !=
                                                                        'Total Employ')
                                                                ? text1 ==
                                                                        'Current Event'
                                                                    ? 'Total Event: ${allLength.data?.currentEvent ?? ''}'
                                                                    : text1 ==
                                                                            'Previous Event'
                                                                        ? 'Total Event: ${allLength.data?.previousEvent ?? ''}'
                                                                        : ''
                                                                : (text1 != 'Create Event' &&
                                                                        text1 !=
                                                                            'Current Event' &&
                                                                        text1 !=
                                                                            'Previous Event')
                                                                    ? 'Total Employe:${allLength?.data?.employee ?? ''}'
                                                                    : '',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                          ),
                                                        ),
                                                      )
                                                    : Image.asset(
                                                        'assets/images/iconscreate.png',
                                                        width: width * 0.3,
                                                        height: height * 0.07,
                                                      )),
                                            Positioned(
                                              top: 14,
                                              right: 8,
                                              child: Icon(
                                                text1 == 'Create Event'
                                                    ? Icons.add
                                                    : Icons.event,
                                                size: 35,
                                                color: Themecolor.primary,
                                              ),
                                            ),
                                            Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top:
                                                        40.0), // Adjust this value as needed
                                                child: Container(
                                                  margin: EdgeInsets.all(8),
                                                  height: height * 0.05,
                                                  width: width * 0.4,
                                                  decoration: ShapeDecoration(
                                                      color: Themecolor.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                      shadows:
                                                          AppConstantsWidgetStyle
                                                              .kShadows),
                                                  child: Center(
                                                    child: Text(
                                                      text1,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  CompanyAttendies(),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.createemploy);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class ModelClass {
  final String title;
  final int? numbers;

  const ModelClass({required this.title, this.numbers});
}
