import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class CheckinProvider extends ChangeNotifier {
  String _name = '';
  String _code='';
 Barcode? _qrResult;
  void get code=>_code;
  void get name => _name;
  void get qrresult=>_qrResult;
  void setname(String value) {
    _name = value;
    notifyListeners();
  }
  void setcode(String code){
    _code=code;
    notifyListeners();
  }
  void setqrcode(value){
    _qrResult=value;
    notifyListeners();
  }
}
