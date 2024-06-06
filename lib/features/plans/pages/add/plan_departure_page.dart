import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/textfields/time_field.dart';
import '../../../../core/widgets/textfields/txt_field.dart';
import '../../widgets/add/stage_title.dart';

class PlanDeparturePage extends StatefulWidget {
  const PlanDeparturePage({super.key});

  @override
  State<PlanDeparturePage> createState() => _PlanDeparturePageState();
}

class _PlanDeparturePageState extends State<PlanDeparturePage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  bool active = false;

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

  @override
  void initState() {
    super.initState();
    controller3.text = '00:12';
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
          CustomAppBar(
            title: 'Add plan',
            subtitle: 'Flight',
            onPressed: () {
              context.pop();
            },
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
                TimeField(controller: controller3),
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
                  onPressed: () {
                    context.push('/plan-arrival');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
