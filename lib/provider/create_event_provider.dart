import 'package:flutter/material.dart';

class EventProvider with ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  final _eventNameController = TextEditingController();
  final _eventVenueController = TextEditingController();
  DateTime? _eventDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  // List<String> _participants = [];

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get eventNameController => _eventNameController;
  TextEditingController get eventVenueController => _eventVenueController;
  DateTime? get eventDate => _eventDate;
  TimeOfDay? get startTime => _startTime;
  TimeOfDay? get endTime => _endTime;
  // List<String> get participants => _participants;

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

  // void addParticipant(String participant) {
  //   _participants.add(participant);
  //   notifyListeners();
  // }

  // void removeParticipant(String participant) {
  //   _participants.remove(participant);
  //   notifyListeners();
  // }

  void saveEvent() {
    if (_formKey.currentState!.validate()) {
      // Save event logic
    }
  }
}
