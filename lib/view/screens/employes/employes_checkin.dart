// import 'dart:async';

// import 'package:another_flushbar/flushbar.dart';
// import 'package:flutter/material.dart';
// import 'package:qr_attendence/config/constants/assetspath.dart';
// import 'package:qr_attendence/config/routes/routes_name.dart';
// import 'package:qr_attendence/config/theme/theme.dart';
// import 'package:qr_attendence/core/utilis/utils.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class Employescheckin extends StatefulWidget {
//   @override
//   _EmployescheckinState createState() => _EmployescheckinState();
// }

// class _EmployescheckinState extends State<Employescheckin> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _codeController = TextEditingController();
//   final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
//   Barcode? _qrResult;
//   QRViewController? _qrViewController;
//   FocusNode namefocusnode = FocusNode();
//   FocusNode codefocusnode = FocusNode();
//   //
//   bool isCheckedIn = false;
//   late DateTime checkInTime;
//   late Timer timer;
//   Duration elapsedTime = Duration();
//    void _checkIn() {
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
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _codeController.dispose();
//     _qrViewController?.dispose();
//     super.dispose();
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       _qrViewController = controller;
//     });
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         _qrResult = scanData;
//       });
//       controller.pauseCamera();
//     });
//   }

//   void _submitForm() {

//     Utils.dismissKeyboard(context);
//     // if (_formKey.currentState!.validate() && _qrResult != null) {
//       // Handle the enrollment and check-in logic here
//       print('Name: ${_nameController.text}');
//       print('Code: ${_codeController.text}');
//       print('QR Code: ${_qrResult?.code}');
//       // You can call an API or save the data as needed
//         Navigator.pushNamed(context, RoutesName.checkout);
//       _checkIn();

//     // } else if (_qrResult == null) {
//     //   ScaffoldMessenger.of(context).showSnackBar(
//     //     SnackBar(content: Text('Please scan the QR code')),
//     //   );
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: Themecolor.whitehalf,
//       appBar: AppBar(
//         title: Text('Employee Enrollment'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(15),
//                     height: height * 0.48,
//                     width: width * 0.9,
//                     decoration: BoxDecoration(
//                         color: Themecolor.white,
//                         // color: Themecolor.orange,
//                         borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(30),
//                             bottomRight: Radius.circular(30)),
//                         border: Border.all(
//                           color: Themecolor.border,
//                           width: 2,
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.8),
//                             spreadRadius: 2,
//                             blurRadius: 5,
//                             offset: Offset(2, 5), // changes position of shadow
//                           ),
//                         ]),
//                     child: Column(
//                       children: [
//                         Image.asset(
//                             height: height * 0.23,
//                             width: double.infinity,
//                             AssetPaths.scanner),
//                         TextFormField(
//                           focusNode: namefocusnode,
//                           controller: _nameController,
//                           onFieldSubmitted: (value) {
//                             Utils.fieldFocusChange(
//                                 context, namefocusnode, codefocusnode);
//                           },
//                           decoration: InputDecoration(labelText: 'Name'),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your name';
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(
//                           height: height * 0.01,
//                         ),
//                         TextFormField(
//                           controller: _codeController,
//                           decoration: InputDecoration(labelText: 'Code'),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your code';
//                             }
//                             return null;
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: height * 0.03),
//                   Container(
//                     padding: EdgeInsets.all(15),
//                     height: height * 0.11,
//                     width: width * 0.9,
//                     decoration: BoxDecoration(
//                         color: Themecolor.white,
//                         // color: Themecolor.orange,
//                         borderRadius: const BorderRadius.only(
//                             topRight: Radius.circular(30),
//                             bottomLeft: Radius.circular(30)),
//                         border: Border.all(
//                           color: Themecolor.border,
//                           width: 2,
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.8),
//                             spreadRadius: 2,
//                             blurRadius: 5,
//                             offset: Offset(2, 5), // changes position of shadow
//                           ),
//                         ]),
//                     child: Column(
//                       children: [
//                         Center(
//                           child: Container(
//                               height: height * 0.06,
//                               width: width * 0.4,
//                               decoration: BoxDecoration(
//                                   color: Themecolor.orange,
//                                   borderRadius: BorderRadius.circular(15)),
//                               child: Center(
//                                   child: Center(
//                                 child: ElevatedButton(

//                                   onPressed: () {
//                                     // Reset QR scanning if already scanned
//                                     _qrResult = null;
//                                     // Resume camera before showing the QR scanner
//                                     _qrViewController?.resumeCamera();
//                                     showDialog(
//                                       context: context,
//                                       builder: (BuildContext context) {
//                                         return Dialog(
//                                           child: Container(
//                                             height: 300,
//                                             width: 300,
//                                             child: QRView(
//                                               key: _qrKey,
//                                               onQRViewCreated: _onQRViewCreated,
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     );
//                                   },
//                                   child: Text('Scan QR Code'),
//                                 ),
//                               ))),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 16.0),
//                   ElevatedButton(
//                     onPressed: _submitForm,
//                     child: Text('Check-in'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_attendence/config/constants/assetspath.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
import 'package:qr_attendence/core/utilis/utils.dart';
import 'package:qr_attendence/view/screens/employes/employ_checkout.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
// Import the check-out screen

class Employescheckin extends StatefulWidget {
  @override
  _EmployescheckinState createState() => _EmployescheckinState();
}

class _EmployescheckinState extends State<Employescheckin> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _codeController = TextEditingController();
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? _qrResult;
  QRViewController? _qrViewController;
  FocusNode namefocusnode = FocusNode();
  FocusNode codefocusnode = FocusNode();

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _qrViewController = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        _qrResult = scanData;
      });
      controller.pauseCamera();
    });
  }

  void _submitForm() {
    Utils.dismissKeyboard(context);
    // Check form validation and QR result
    print('Name: ${_nameController.text}');
    print('Code: ${_codeController.text}');
    print('QR Code: ${_qrResult?.code}');

    // Navigate to Check-Out Screen with necessary data
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckInCheckOutScreen(
          _nameController.text,
          _codeController.text,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _qrViewController?.dispose();
    super.dispose();
  }

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
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back,color: Themecolor.white,)),
          title: Text(
            'Employee Enrollment',
            style:
                TextStyle(color: Themecolor.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          // padding: EdgeInsets.all(16.0),
          child: Container(
          
            height: height*0.9,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Themecolor.white,
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(15),
                        height: height * 0.58,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                            color: Themecolor.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            border: Border.all(
                              color: Themecolor.border,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(2, 5),
                              ),
                            ]),
                        child: Column(
                          children: [
                            Image.asset(
                                height: height * 0.23,
                                width: double.infinity,
                                AssetPaths.scanner),
                            TextFormField(
                              focusNode: namefocusnode,
                              controller: _nameController,
                              onFieldSubmitted: (value) {
                                Utils.fieldFocusChange(
                                    context, namefocusnode, codefocusnode);
                              },
                              decoration: InputDecoration(labelText: 'Name'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            TextFormField(
                              controller: _codeController,
                              decoration: InputDecoration(labelText: 'Code'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your code';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: height * 0.03),
                            Container(
                              padding: EdgeInsets.all(15),
                              height: height * 0.11,
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                  color: Themecolor.white,
                                  // color: Themecolor.orange,
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomLeft: Radius.circular(30)),
                                  border: Border.all(
                                    color: Themecolor.border,
                                    width: 2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.8),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(
                                          2, 5), // changes position of shadow
                                    ),
                                  ]),
                              child: Column(
                                children: [
                                  Center(
                                    child: Container(
                                        height: height * 0.06,
                                        width: width * 0.4,
                                        decoration: BoxDecoration(
                                            color: Themecolor.orange,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Center(
                                            child: Center(
                                          child: InkWell(
                                            onTap: () {
                                              _qrResult = null;
                                              //       // Resume camera before showing the QR scanner
                                              _qrViewController?.resumeCamera();
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return Dialog(
                                                    child: Container(
                                                      height: 300,
                                                      width: 300,
                                                      child: QRView(
                                                        key: _qrKey,
                                                        onQRViewCreated:
                                                            _onQRViewCreated,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 48,
                                              decoration: BoxDecoration(
                                                gradient:const LinearGradient(
                                                  colors: [
                                                    Themecolor.primary,
                                                    Themecolor.primaryLight
                                                  ],
                                                  // colors:[Themecolor.primary,  Themecolor.primaryLight],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child:const Center(
                                                  child: Text(
                                                'Scan QR Code',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold),
                                              )),
                                            ),
                                          ),
                                        ))),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 16.0),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      InkWell(
                        onTap: _submitForm,
                        child: Container(
                          width: width*0.8,
                          height: height*0.06,
                          decoration: BoxDecoration(
                            gradient:const LinearGradient(
                              colors: [
                                Themecolor.primary,
                                Themecolor.primaryLight
                              ],
                              // colors:[Themecolor.primary,  Themecolor.primaryLight],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child:const Center(
                              child: Text(
                            'Check in',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
