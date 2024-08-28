
import 'package:qr_attendence/config/constants/api_links.dart';
import 'package:qr_attendence/core/components/session_handling.dart';
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


  
  Future<dynamic> checkin(Map<String, dynamic> data,var token) async {
    try {
      dynamic response =
          await apiServices.fetchPostApi(Applinks.checkIn, data,token);
      return response;
    } catch (e) {
      rethrow;
    }
  }




  
  Future<dynamic> checkout(Map<String, dynamic> data,var token) async {
    try {
      dynamic response =
          await apiServices.fetchPostApi(Applinks.checkout, data,token);
      return response;
    } catch (e) {
      rethrow;
    }
  }


  
     Future<dynamic> FetchAllEventsForEmployee() async {
    try {
      final token = await SessionHandlingViewModel().getCompanyToken();

      dynamic response =
          await apiServices.fetchGetApi(Applinks.fetchallEventsForEmployee, token);
          
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
