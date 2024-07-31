// import 'package:flutter/material.dart';
// import 'dart:async';

// import 'package:qr_attendence/config/theme/theme.dart';

// class CheckInCheckOutScreen extends StatefulWidget {
//   @override
//   _CheckInCheckOutScreenState createState() => _CheckInCheckOutScreenState();
// }

// class _CheckInCheckOutScreenState extends State<CheckInCheckOutScreen> {
//   bool isCheckedIn = false;
//   late DateTime checkInTime;
//    late Timer timer = Timer(Duration.zero, () {}); 
//   Duration elapsedTime = Duration();

//   void _checkIn() {
//     setState(() {
//       isCheckedIn = true;
//       checkInTime = DateTime.now();
//       elapsedTime = Duration();
//     });

//     timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         elapsedTime = DateTime.now().difference(checkInTime);
//       });
//     });
//   }

//   void _checkOut() {
//     timer.cancel();
//     setState(() {
//       isCheckedIn = false;
//     });

//     // Display total elapsed time
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Total Time"),
//           content: Text(
//               "You have been checked in for ${elapsedTime.inHours}:${elapsedTime.inMinutes.remainder(60)}:${elapsedTime.inSeconds.remainder(60)}"),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("OK"),
//             )
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Check In/Out Screen"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Elapsed Time: ${elapsedTime.inHours}:${elapsedTime.inMinutes.remainder(60)}:${elapsedTime.inSeconds.remainder(60)}",
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 20),

//              CustomPaint(
//                         size: Size(200, 200), // Size of the clock
//                         painter: ClockPainter(elapsedTime: elapsedTime),
//                       ),
//                       SizedBox(height: 20),
//             // isCheckedIn
//             //     ? Column(
//             //         children: [
                     
//             //           SizedBox(height: 20),
//             //           ElevatedButton(
//             //             onPressed: _checkOut,
//             //             child: Text("Check Out"),
//             //           ),
//             //         ],
//                             InkWell
//                   (
//                     onTap: (){
                      
//                     },
//                     child: Container(
//                     margin: EdgeInsets.only(right: 20,left: 20),
//                       width: double.infinity,
//                       height: 48,
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [Themecolor.primary, Themecolor.primaryLight],
//                           // colors:[Themecolor.primary,  Themecolor.primaryLight],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Center(
//                           child: Text(
//                         'Check out',
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.bold),
//                       )),
//                     ),
//                   ),
//                 // : ElevatedButton(
//                 //     onPressed: _checkIn,
//                 //     child: Text("Check In"),
//                 //   ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     timer.cancel();
//     super.dispose();
//   }
// }

// class ClockPainter extends CustomPainter {
//   final Duration elapsedTime;

//   ClockPainter({required this.elapsedTime});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint circlePaint = Paint()
//       ..color = Colors.grey.shade300
//       ..strokeWidth = 10
//       ..style = PaintingStyle.stroke;

//     final Paint progressPaint = Paint()
//       ..color = Themecolor.primary
//       ..strokeWidth = 10
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     final double progress = (elapsedTime.inSeconds % 60) / 60.0;
//     final Offset center = Offset(size.width / 2, size.height / 2);
//     final double radius = size.width / 2;

//     canvas.drawCircle(center, radius, circlePaint);
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       -90 * 3.1415926535897932 / 180, // Start angle
//       2 * 3.1415926535897932 * progress, // Sweep angle
//       false,
//       progressPaint,
//     );

//     final TextSpan span = TextSpan(
//       style: TextStyle(color: Colors.black, fontSize: 24),
//       text:
//           "${elapsedTime.inHours}:${elapsedTime.inMinutes.remainder(60)}:${elapsedTime.inSeconds.remainder(60)}",
//     );
//     final TextPainter tp = TextPainter(
//       text: span,
//       textAlign: TextAlign.center,
//       textDirection: TextDirection.ltr,
//     );
//     tp.layout();
//     tp.paint(
//       canvas,
//       Offset(center.dx - tp.width / 2, center.dy - tp.height / 2),
//     );
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }




import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';

class CheckInCheckOutScreen extends StatefulWidget {
  final String name;
  final String code;

 const CheckInCheckOutScreen( this.name,  this.code);

  @override
  _CheckInCheckOutScreenState createState() => _CheckInCheckOutScreenState();
}

class _CheckInCheckOutScreenState extends State<CheckInCheckOutScreen> {
  late DateTime checkInTime;
  late Timer timer;
  Duration elapsedTime = Duration();

  @override
  void initState() {
    super.initState();
    checkInTime = DateTime.now();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        elapsedTime = DateTime.now().difference(checkInTime);
      });
    });
  }

  void _checkOut() {
    timer.cancel();
    setState(() {});

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Total Time"),
          content: Text(
              "You have been checked in for ${elapsedTime.inHours}:${elapsedTime.inMinutes.remainder(60)}:${elapsedTime.inSeconds.remainder(60)}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            )
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
        final height=MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        gradient: AppConstantsWidgetStyle.kgradientScreen
      ),
      child: Scaffold(
        
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back,color: Themecolor.white,)),
          title: Text("Check Out Screen",style: TextStyle(color: Themecolor.white),),
        ),
        
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: height*0.9,
                // constraints: BoxConstraints(
                //   maxHeight: double.infinity
                // ),
                decoration: BoxDecoration(
                  color: Themecolor.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                
                ),
                
                child: Container(
                  // height: height*0.4,
                  // width: double.infinity,
                  margin: EdgeInsets.all(30),
                  decoration: ShapeDecoration(
                                  color: Themecolor.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  shadows: AppConstantsWidgetStyle.kShadows),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Elapsed Time: ${elapsedTime.inHours}:${elapsedTime.inMinutes.remainder(60)}:${elapsedTime.inSeconds.remainder(60)}",
                        style: TextStyle(fontSize: 24,color: Themecolor.black),
                      ),
                      SizedBox(height: 20),
                      CustomPaint(
                        size: Size(200, 200),
                        painter: ClockPainter(elapsedTime: elapsedTime),
                      ),
                    
                      
                       SizedBox(height: 20),
                          InkWell(
                            onTap: _checkOut,
                            child: Container(
                              width:width*0.6 ,
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
                                'Check out',
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final Duration elapsedTime;

  ClockPainter({required this.elapsedTime});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint circlePaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    final Paint progressPaint = Paint()
      ..color = Themecolor.primary
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double progress = (elapsedTime.inSeconds % 60) / 60.0;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 2;

    canvas.drawCircle(center, radius, circlePaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -90 * 3.1415926535897932 / 180,
      2 * 3.1415926535897932 * progress,
      false,
      progressPaint,
    );

    final TextSpan span = TextSpan(
      style: TextStyle(color: Colors.black, fontSize: 24),
      text:
          "${elapsedTime.inHours}:${elapsedTime.inMinutes.remainder(60)}:${elapsedTime.inSeconds.remainder(60)}",
    );
    final TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    tp.paint(
      canvas,
      Offset(center.dx - tp.width / 2, center.dy - tp.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
