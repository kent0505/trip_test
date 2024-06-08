import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../features/plans/models/note.dart';
import '../features/plans/models/plan.dart';

bool onboarding = true;

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  onboarding = prefs.getBool('onboarding') ?? true;
  log(onboarding.toString());
}

Future<void> saveBool(String key, bool value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}

String getPlanTotalAmount(Plan plan) {
  try {
    int totalPrice = plan.ticketPrice + plan.hotel.price;
    for (Note note in plan.notes) {
      totalPrice += note.price;
    }
    return totalPrice.toString();
  } catch (e) {
    return '0';
  }
}

int getPlanNotesAmount(Plan plan) {
  try {
    int totalPrice = 0;
    for (Note note in plan.notes) {
      totalPrice += note.price;
    }
    return totalPrice;
  } catch (e) {
    return 0;
  }
}

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String getCurrentTime() {
  DateTime now = DateTime.now();
  String formattedTime =
      "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
  return formattedTime;
}

String formatDateTime(DateTime dateTime) {
  String formattedTime =
      "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  return formattedTime;
}

DateTime parseTimeString(String timeString) {
  try {
    List<String> parts = timeString.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    DateTime now = DateTime.now();
    DateTime dateTime = DateTime(now.year, now.month, now.day, hour, minute);
    return dateTime;
  } catch (e) {
    return DateTime.now();
  }
}
