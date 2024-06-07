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
  double totalPrice = plan.ticketPrice + plan.hotel.price;
  for (Note note in plan.notes) {
    totalPrice += note.price;
  }
  return totalPrice.toStringAsFixed(2);
}

double getPlanNotesAmount(Plan plan) {
  double totalPrice = 0;
  for (Note note in plan.notes) {
    totalPrice += note.price;
  }
  return totalPrice;
}

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}
