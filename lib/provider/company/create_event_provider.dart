import 'package:flutter/material.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/core/components/session_handling.dart';
import 'package:qr_attendence/core/utilis/utils.dart';
import 'package:qr_attendence/data/repository/academy/company.dart';

class EventProvider with ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  final _eventNameController = TextEditingController();
  final _eventVenueController = TextEditingController();
  final _eventDescriptionController = TextEditingController();
  DateTime? _eventDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get eventNameController => _eventNameController;
  TextEditingController get eventVenueController => _eventVenueController;
  TextEditingController get eventDescriptionController =>
      _eventDescriptionController;
  DateTime? get eventDate => _eventDate;
  TimeOfDay? get startTime => _startTime;
  TimeOfDay? get endTime => _endTime;

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _eventDate) {
      _eventDate = picked;
      notifyListeners();
    }
  }

  void selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      if (isStartTime) {
        _startTime = picked;
      } else {
        _endTime = picked;
      }
      notifyListeners();
    }
  }

  void saveEvent(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> eventData = {
        'eventName': _eventNameController.text,
        'description': _eventDescriptionController.text,
        'eventVenue': _eventVenueController.text,
        'date': _eventDate?.toIso8601String(),
        'startTime': _startTime?.format(context),
        'endTime': _endTime?.format(context),
      };
      createEvent(eventData, context);
    }
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> createEvent(
      Map<String, dynamic> data, BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    final token = await SessionHandlingViewModel().getCompanyToken();
    print(":::: the token of company is here: $token");

    try {
      final response = await Company().createEvent(data, token);
      print("::: the response of API is: $response");

      if (response['success'] == true) {
        final msg = response['msg'];
        final success = response['success'];

        if (success == true) {
          Utils.toastMessage(msg);
          print("::: the msg is: $msg");
          // Navigator.pushReplacementNamed(context, RoutesName.hostDashboard);
        } else {
          Utils.toastMessage(msg);
        }
      } else {
        Utils.toastMessage(
            'Something went wrong. Status code: ${response['status']}');
      }
    } catch (e) {
      _errorMessage = 'An error occurred. Please try again.';
      print('Error: $e');
      Utils.toastMessage("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
