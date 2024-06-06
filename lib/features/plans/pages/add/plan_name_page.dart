import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/textfields/txt_field.dart';
import '../../widgets/add/stage_title.dart';

class PlanNamePage extends StatefulWidget {
  const PlanNamePage({super.key});

  @override
  State<PlanNamePage> createState() => _PlanNamePageState();
}

class _PlanNamePageState extends State<PlanNamePage> {
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
    context.push('/plan-departure');
  }

  @override
  void dispose() {
    log('DISPOSE PLAN NAME PAGE');
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Add plan',
            subtitle: 'Start',
            onPressed: () {
              context.pop();
            },
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
