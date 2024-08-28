class Applinks {
  // static var baseUrl = 'http://3.25.172.114';
  // static var loginForPassenger = '$baseUrl/api/driver/login';

  static var baseUrl = 'http://13.55.37.53';

  // <---------------------- company--------------------------------------------------------------------------------------------------------------->

  static var signupForcompany = '$baseUrl/api/company/create';
  static var signinForcompany = '$baseUrl/api/company/login';
  static var createEmploy = '$baseUrl/api/employee/signUp';
  static var createEvent = '$baseUrl/api/event/create-event';
  static var logoutCompany = '$baseUrl/compnay/logout';
   static var totalEmployee = '$baseUrl/api/employee/';
   static var allLength = '$baseUrl/api/company/all-length';
   static var fetchAllEvents= '$baseUrl/api/event/all';
   static var addpeopletoEvent= '$baseUrl/api/event/addAttendees';
     static var fetchallAttendenseByDate= '$baseUrl/api/company/attendance/by-date';
     static var fetchAllCompanyDetails= '$baseUrl/api/company/details';
      static var fetcheventAttendenceForCompany= '$baseUrl/api/company/eventattendance';

   

  ///////////////////////////////////Employ hare//////////////////////////////////////
    static var loginEmploy = '$baseUrl/api/employee/signIn';
     static var checkIn = '$baseUrl/api/employee/checkIn';
      static var checkout = '$baseUrl/api/employee/checkOut';
         static var getallAttendece = '$baseUrl/api/employee/attendance';
         static var fetchallEventsForEmployee = '$baseUrl/api/employee/events';

}
