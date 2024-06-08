import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/textfields/txt_field.dart';
import '../../models/plan.dart';
import '../../widgets/add/stage_title.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key, required this.plan});

  final Plan plan;

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  final controller = TextEditingController();

  bool active = false;

  void onChanged(String text) {
    if (text.isEmpty) {
      if (!active) return;
      setState(() => active = false);
    } else {
      if (active) return;
      setState(() => active = true);
    }
  }

  void onNext() {
    context.push(
      '/edit-departure',
      extra: Plan(
        id: widget.plan.id,
        name: controller.text,
        departure: widget.plan.departure,
        arrival: widget.plan.arrival,
        ticketPrice: widget.plan.ticketPrice,
        hotel: widget.plan.hotel,
        notes: widget.plan.notes,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller.text = widget.plan.name;
    active = true;
  }

  @override
  void dispose() {
    log('DISPOSE EDIT NAME PAGE');
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            title: 'Edit plan',
            subtitle: 'Start',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const StageTitle(title: 'Name plan'),
                TxtField(
                  controller: controller,
                  hintText: 'Name',
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
