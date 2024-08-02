// import 'dart:io';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:share/share.dart';

// class QrCodeScreen extends StatelessWidget {
//   final String data;

//   const QrCodeScreen({Key? key, required this.data}) : super(key: key);

//   Future<void> _saveQrCode(BuildContext context) async {
//     try {
//       final status = await Permission.storage.request();
//       if (status.isGranted) {
//         final qrCode = QrCode.fromData(
//           errorCorrectLevel: QrErrorCorrectLevel.L,
//           data: data,
//         );
//         final painter = QrPainter(
//           version: QrVersions.auto,
//           color: Colors.black,
//           emptyColor: Colors.white,
//           gapless: true,
//           data: data,
//         );

//         Directory? directory;
//         if (Platform.isAndroid) {
//           directory = await getExternalStorageDirectory();
//         } else {
//           directory = await getApplicationDocumentsDirectory();
//         }

//         final path = '${directory!.path}/qr_code.png';
//         final file = File(path);
//         await file.create(recursive: true);

//         final picData =
//             await painter.toImageData(2048, format: ImageByteFormat.png);
//         await file.writeAsBytes(picData!.buffer.asUint8List());

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('QR Code saved to gallery!')),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Permission denied to access storage!')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error saving QR Code: $e')),
//       );
//     }
//   }

//   void _shareQrCode() {
//     Share.share(data);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('QR Code'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // QrImage(
//             //   data: data,
//             //   version: QrVersions.auto,
//             //   size: 200.0,
//             // ),
//             QrImageView(
//               data: data,
//               version: QrVersions.auto,
//               size: 200.0,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _saveQrCode(context),
//               child: Text('Download QR Code'),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: _shareQrCode,
//               child: Text('Share QR Code'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';

class QrCodeScreen extends StatelessWidget {
  final String data;

  const QrCodeScreen({Key? key, required this.data}) : super(key: key);

  Future<void> _saveQrCode(BuildContext context) async {
    try {
      final status = await Permission.storage.request();
      if (status.isGranted) {
        final qrCode = QrCode.fromData(
          errorCorrectLevel: QrErrorCorrectLevel.L,
          data: data,
        );
        final painter = QrPainter(
          version: QrVersions.auto,
          color: Colors.black,
          emptyColor: Colors.white,
          gapless: true,
          data: data,
        );

        Directory? directory;
        if (Platform.isAndroid) {
          directory = await getExternalStorageDirectory();
        } else {
          directory = await getApplicationDocumentsDirectory();
        }

        final path = '${directory!.path}/qr_code.png';
        final file = File(path);
        await file.create(recursive: true);

        final picData =
            await painter.toImageData(2048, format: ImageByteFormat.png);
        await file.writeAsBytes(picData!.buffer.asUint8List());

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('QR Code saved to gallery!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Permission denied to access storage!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving QR Code: $e')),
      );
    }
  }

  void _shareQrCode(BuildContext context) async {
    try {
      final qrCode = QrCode.fromData(
        errorCorrectLevel: QrErrorCorrectLevel.L,
        data: data,
      );
      final painter = QrPainter(
        version: QrVersions.auto,
        color: Colors.black,
        emptyColor: Colors.white,
        gapless: true,
        data: data,
      );

      final imageData =
          await painter.toImageData(2048, format: ImageByteFormat.png);
      final bytes = Uint8List.fromList(imageData!.buffer.asUint8List());

      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/qr_code.png');
      await tempFile.writeAsBytes(bytes);

      await Share.shareFiles(['${tempFile.path}'], text: 'QR Code');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error sharing QR Code: $e')),
      );
    }
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
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Themecolor.white,
              )),
          title: const Text(
            'QR Code',
            style: TextStyle(color: Themecolor.white),
          ),
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Themecolor.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QrImageView(
                  data: data,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: () => _saveQrCode(context),
                //   child: Text('Download QR Code'),
                // ),

                InkWell(
                  onTap: () => _saveQrCode(context),
                  child: Container(
                    width: width*0.7,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Themecolor.primary, Themecolor.primaryLight],
                        // colors:[Themecolor.primary,  Themecolor.primaryLight],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                        child: Text(
                      'Download QR Code',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),

                SizedBox(height: 10),
                // ElevatedButton(
                //   onPressed: () => _shareQrCode(context),
                //   child: Text('Share QR Code'),
                // ),
                  InkWell(
                  onTap: () => _shareQrCode(context),
                  child: Container(
                    width: width*0.7,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Themecolor.primary, Themecolor.primaryLight],
                        // colors:[Themecolor.primary,  Themecolor.primaryLight],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                        child: Text(
                      'Share QR Code',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
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
