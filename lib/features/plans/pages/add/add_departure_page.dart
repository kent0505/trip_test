import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils.dart';
import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/picker/time_picker.dart';
import '../../../../core/widgets/textfields/time_field.dart';
import '../../../../core/widgets/textfields/txt_field.dart';
import '../../models/flight.dart';
import '../../models/hotel.dart';
import '../../models/plan.dart';
import '../../widgets/add/stage_title.dart';

class AddDeparturePage extends StatefulWidget {
  const AddDeparturePage({super.key, required this.name});

  final String name;

  @override
  State<AddDeparturePage> createState() => _AddDeparturePageState();
}

class _AddDeparturePageState extends State<AddDeparturePage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  bool active = false;
  String pickedTime = '';

  void onChanged(String text) {
    setState(() {
      if (controller1.text.isEmpty) {
        active = false;
      } else if (controller2.text.isEmpty) {
        active = false;
      } else if (controller4.text.isEmpty) {
        active = false;
      } else {
        active = true;
      }
    });
  }

  void onNext() {
    context.push(
      '/add-arrival',
      extra: Plan(
        id: getCurrentTimestamp(),
        name: widget.name,
        departure: Flight(
          country: controller1.text,
          city: controller2.text,
          time: controller3.text,
          airport: controller4.text,
        ),
        arrival: Flight(country: '', city: '', time: '', airport: ''),
        ticketPrice: 0,
        hotel: Hotel(name: '', price: 0),
        notes: [],
      ),
    );
  }

  void showTimePicker() {
    showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return TimePicker(
          time: controller3.text,
          onSave: () {
            setState(() {
              controller3.text = pickedTime;
            });
            context.pop();
          },
          onDateTimeChanged: (newTime) {
            pickedTime = formatDateTime(newTime);
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    log(widget.name);
    controller3.text = getCurrentTime();
  }

  @override
  void dispose() {
    log('DISPOSE PLAN DEPARTURE PAGE');
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            title: 'Add plan',
            subtitle: 'Flight',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const StageTitle(title: 'Departure'),
                TxtField(
                  controller: controller1,
                  hintText: 'Country',
                  onChanged: onChanged,
                ),
                const SizedBox(height: 8),
                TxtField(
                  controller: controller2,
                  hintText: 'City',
                  onChanged: onChanged,
                ),
                const SizedBox(height: 8),
                TimeField(
                  controller: controller3,
                  onTap: showTimePicker,
                ),
                const SizedBox(height: 8),
                TxtField(
                  controller: controller4,
                  hintText: 'Airport',
                  onChanged: onChanged,
                ),
                const SizedBox(height: 16),
                PrimaryButton(
                  title: 'Next',
                  active: active,
                  onPressed: onNext,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
