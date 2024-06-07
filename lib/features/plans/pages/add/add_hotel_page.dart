import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/textfields/price_field.dart';
import '../../../../core/widgets/textfields/txt_field.dart';
import '../../widgets/add/stage_title.dart';

class AddHotelPage extends StatefulWidget {
  const AddHotelPage({super.key});

  @override
  State<AddHotelPage> createState() => _AddHotelPageState();
}

class _AddHotelPageState extends State<AddHotelPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  bool active = false;

  void onChanged(String text) {
    setState(() {
      if (controller1.text.isEmpty) {
        active = false;
      } else if (controller2.text.isEmpty) {
        active = false;
      } else {
        active = true;
      }
    });
  }

  @override
  void dispose() {
    log('DISPOSE PLAN HOTEL PAGE');
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Add plan',
            subtitle: 'Hotel',
            onSkip: () {},
            onPressed: () {
              context.pop();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const StageTitle(title: 'Hotel'),
                TxtField(
                  controller: controller1,
                  hintText: 'Name hotel',
                  onChanged: onChanged,
                ),
                const SizedBox(height: 8),
                PriceField(
                  controller: controller2,
                  onChanged: onChanged,
                ),
                const SizedBox(height: 16),
                PrimaryButton(
                  title: 'Next',
                  active: active,
                  onPressed: () {
                    context.push('/plan-note');
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
