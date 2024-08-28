import 'dart:io';
import 'dart:typed_data';


import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
import 'package:qr_attendence/view/screens/Host/screenshot.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';


class QRCodeGenerator extends StatefulWidget {
  final String data;


  QRCodeGenerator({required this.data});

  @override
  State<QRCodeGenerator> createState() => _QRCodeGeneratorState();
}

class _QRCodeGeneratorState extends State<QRCodeGenerator> {
  final ScreenshotController _screenShotController =
      ScreenshotController(); 
  @override
  Widget build(BuildContext context) {
    print(":: thr code of company is :${widget.data}");
// Check if the employee ID is longer than four characters
      String lastFourCharacters = widget.data.substring(widget.data.length - 5);
      // String restOfTheString = data.substring(0, data.length - 4);

      // print("Last four characters of the employee ID: $lastFourCharacters");
      // print("Rest of the employee ID: $restOfTheString");
    return Container(
      decoration: BoxDecoration(
        gradient: AppConstantsWidgetStyle.kgradientScreen,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: Themecolor.white,)),
          title: Text('Generate Qr',style: TextStyle(color: Themecolor.white),),),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Screenshot(
              controller: _screenShotController,
              child: Container(
                padding: EdgeInsets.all(18),
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(height: MediaQuery.of(context).size.height / 6),
                      QrImageView(
                        data: widget.data,
                        version: QrVersions.auto,
                        size: MediaQuery.of(context).size.width / 1.5,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 15),
                      Text(
                        'Manual ID: $lastFourCharacters',
                        style: TextStyle(color: Themecolor.black),
                      ),
                      Text('Scan the QR code or enter the ID above to Clock In'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _captureAndShare();
              },
             child: Text('send'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _captureAndShare() async {
    try {
      // Capture the screenshot
      Uint8List? image = await _screenShotController.capture(
          delay: const Duration(milliseconds: 10));

      if (image != null) {
        // Get the application documents directory
        final directory = await getApplicationDocumentsDirectory();

        // Create a file to store the captured image
        final imagePath = await File('${directory.path}/image.png').create();

        // Write the image bytes to the file
        await imagePath.writeAsBytes(image);

        // Share the captured image using the Share plugin
        // ignore: deprecated_member_use
        await Share.shareFiles([imagePath.path]);
      }
    } catch (error) {
      print(error);
    }
  }
}
