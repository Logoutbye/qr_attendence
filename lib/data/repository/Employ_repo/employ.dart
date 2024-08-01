
import 'package:qr_attendence/config/constants/api_links.dart';
import 'package:qr_attendence/data/model/login_employ_model.dart';
import 'package:qr_attendence/data/network/base_api_services.dart';
import 'package:qr_attendence/data/network/network_appi_services.dart';
import 'package:qr_attendence/services/splash_services/session_handling.dart';

class Employ {
  BaseApiServices apiServices = NetworkApiService();

 

  Future<dynamic> loginEmploy(Map<String, dynamic> data,) async {
    try {
      dynamic response =
          await apiServices.fetchPostApi(Applinks.loginEmploy, data,null);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
