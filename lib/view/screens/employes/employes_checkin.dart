import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_attendence/config/constants/assetspath.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
import 'package:qr_attendence/core/utilis/drawer.dart';
import 'package:qr_attendence/core/utilis/utils.dart';
import 'package:qr_attendence/provider/checkin_provider.dart';
import 'package:qr_attendence/view/screens/employes/employ_checkout.dart';
import 'package:qr_attendence/view/screens/employes/employ_drawer.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Employescheckin extends StatefulWidget {
  final String? eventsname;
  final bool isevent;
  Employescheckin({this.eventsname, this.isevent = false});
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

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _qrViewController?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _qrViewController = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        _qrResult = scanData;
      });
      controller.pauseCamera();
      print('Scanned QR Code: ${_qrResult?.code}');
      // Automatically close the QR scanner dialog after scanning
      Navigator.of(context).pop();
    });
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()
        //  && _qrResult != null
        ) {
      Utils.dismissKeyboard(context);
      print('Name: ${_nameController.text}');
      print('Code: ${_codeController.text}');
      print('QR Code: ${_qrResult?.code}');
      final code = _codeController.text;
      final result = _qrResult?.code;
      Map<String, dynamic> data = {
        "companyCode": code,
      };
      await CheckinProvider().checkIn(data, result, context, code);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Please complete the form and scan the QR code.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
     endDrawer: EmployeDrawerWidget(height: height * 0.9),
      backgroundColor: Themecolor.whitehalf,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Themecolor.white),
        ),
        title: Text(
          widget.isevent
              ? (widget.eventsname ??
                  'Event Name') // Provide a fallback if eventsname is null
              : 'Employee Enrollment',
          style:
              TextStyle(color: Themecolor.white, fontWeight: FontWeight.bold),
        ),
         flexibleSpace: Container(
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
                ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height * 0.9,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Themecolor.white,
              borderRadius: BorderRadius.all(Radius.circular(30))),
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
                            focusNode: codefocusnode,
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
                                    offset: Offset(2, 5),
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
                                    child: InkWell(
                                      onTap: () {
                                        _qrResult = null;
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
                                                  overlay:
                                                      QrScannerOverlayShape(
                                                    borderColor:
                                                        Themecolor.primary,
                                                    borderRadius: 10,
                                                    borderLength: 30,
                                                    borderWidth: 10,
                                                    cutOutSize: 250,
                                                  ),
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
                                          gradient: const LinearGradient(
                                            colors: [
                                              Themecolor.primary,
                                              Themecolor.primaryLight
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Center(
                                            child: Text(
                                          'Scan QR Code',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                    ),
                                  ),
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
                        width: width * 0.8,
                        height: height * 0.06,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Themecolor.primary,
                              Themecolor.primaryLight
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                            child: Text(
                          'Check in',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RoutesName.fetchalleventForEmploye);
                      },
                      child: Container(
                        width: width * 0.8,
                        height: height * 0.06,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Themecolor.primary,
                              Themecolor.primaryLight
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                            child: Text(
                          'Events',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
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
    );
  }
}
