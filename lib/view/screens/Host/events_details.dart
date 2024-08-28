import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
import 'package:qr_attendence/data/model/fetch_all_event_model.dart';
import 'package:readmore/readmore.dart';

class EventsDetsils extends StatefulWidget {
  final Event event;
  const EventsDetsils({super.key, required this.event});

  @override
  State<EventsDetsils> createState() => _EventsDetsilsState();
}

class _EventsDetsilsState extends State<EventsDetsils> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
                icon: Icon(
                  Icons.arrow_back,
                  color: Themecolor.white,
                )),
            title: Text(
              widget.event.eventName ?? '',
              style: TextStyle(color: Themecolor.white),
            ),
            centerTitle: true,
          ),
          body: Container(
            height: double.infinity,
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
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(10),
                  // height: double.infinity,
                  height: height * 0.4,
                  width: width * 0.99,
                  decoration: ShapeDecoration(
                      color: Themecolor.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      shadows: AppConstantsWidgetStyle.kShadows),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                 Container(
              height: 110,
              width: MediaQuery.of(context).size.width * 0.9,
             decoration: ShapeDecoration(
                     gradient: AppConstantsWidgetStyle.kgradientScreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      shadows: AppConstantsWidgetStyle.kShadows),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.description,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text("Description",
                              style: TextStyle(
                                fontSize: 20,
                                color: Themecolor.white,
                                fontWeight: FontWeight.bold
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      ReadMoreText(
                         widget.event.description??"",
                         style: TextStyle(color: Themecolor.whitehalf),
                                  trimCollapsedText: 'show more',
                                  trimExpandedText: 'show less',
                                  trimLines: 2,
                                  trimMode: TrimMode.Line,
                                  trimLength: 240,
                                  
                                  colorClickableText: Colors.white,
                      )
                      // Text(
                      //   widget.customRating.description,
                      //   style: const TextStyle(
                      //     color: Colors.grey,
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
                  SizedBox(
                        height: height * 0.01,
                      ),
                      Divider(),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: height * 0.18,
                        width: width * 0.9,
                        decoration: ShapeDecoration(
                            gradient: AppConstantsWidgetStyle.kgradientScreen,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            shadows: AppConstantsWidgetStyle.kShadows),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.location_on_outlined,color: Themecolor.white,),
                                SizedBox(width: width*0.01,),
                                Expanded(
                                  child: Text.rich(TextSpan(children: [
                                
                                      
                                    
                                    TextSpan(

                                      text: 'Event venue: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Themecolor.white,
                                      ),
                                    ),
                                    TextSpan(
                                      text: widget.event.eventVenue ?? '',
                                      style: TextStyle(
                                        color: Themecolor.whitehalf,
                                      ),
                                    ),
                                  ])),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.01),
                            Divider(),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.date_range_outlined,color: Themecolor.white,),
                                SizedBox(width: width*0.01,),
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text: 'Date: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Themecolor.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.event.date != null
                                        ? DateFormat('yyyy-MM-dd')
                                            .format(widget.event.date!)
                                        : 'N/A',
                                    style: TextStyle(color: Themecolor.whitehalf),
                                  ),
                                ]))
                              ],
                            ),
                            SizedBox(height: height * 0.01),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                
                                Row(
                                  children: [
                                    Icon(Icons.timelapse_outlined,color: Themecolor.white,),
                                    SizedBox(width: width*0.01,),
                                    Text.rich(TextSpan(children: [
                                      TextSpan(
                                        text: 'Start Time: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Themecolor.white,
                                        ),
                                      ),
                                      TextSpan(
                                        text: widget.event.startTime,
                                        style: TextStyle(color: Themecolor.whitehalf),
                                      ),
                                    ])),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.timer_outlined,color: Themecolor.white,),
                                    SizedBox(width: width*0.01,),
                                    Text.rich(TextSpan(children: [
                                      TextSpan(
                                        text: 'End Time: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Themecolor.white,
                                        ),
                                      ),
                                      TextSpan(
                                        text: widget.event.endTime,
                                        style: TextStyle(color: Themecolor.whitehalf),
                                      ),
                                    ])),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
