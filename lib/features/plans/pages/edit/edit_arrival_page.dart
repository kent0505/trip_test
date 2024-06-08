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
import '../../models/plan.dart';
import '../../widgets/add/stage_title.dart';

class EditArrivalPage extends StatefulWidget {
  const EditArrivalPage({super.key, required this.plan});

  final Plan plan;

  @override
  State<EditArrivalPage> createState() => _EditArrivalPageState();
}

class _EditArrivalPageState extends State<EditArrivalPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  bool active = true;
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
      '/edit-ticket',
      extra: Plan(
        id: widget.plan.id,
        name: widget.plan.name,
        departure: widget.plan.departure,
        arrival: Flight(
          country: controller1.text,
          city: controller2.text,
          time: controller3.text,
          airport: controller4.text,
        ),
        ticketPrice: widget.plan.ticketPrice,
        hotel: widget.plan.hotel,
        notes: widget.plan.notes,
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
    controller1.text = widget.plan.arrival.country;
    controller2.text = widget.plan.arrival.city;
    controller3.text = widget.plan.arrival.time;
    controller4.text = widget.plan.arrival.airport;
  }

  @override
  void dispose() {
    log('DISPOSE EDIT ARRIVAL PAGE');
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
            title: 'Edit plan',
            subtitle: 'Flight',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const StageTitle(title: 'Arrival'),
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
