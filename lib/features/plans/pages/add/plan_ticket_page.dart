import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/textfields/price_field.dart';
import '../../widgets/add/stage_title.dart';

class PlanTicketPage extends StatefulWidget {
  const PlanTicketPage({super.key});

  @override
  State<PlanTicketPage> createState() => _PlanTicketPageState();
}

class _PlanTicketPageState extends State<PlanTicketPage> {
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

  @override
  void dispose() {
    log('DISPOSE PLAN TICKET PAGE');
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
            subtitle: 'Flight',
            onPressed: () {
              context.pop();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const StageTitle(title: 'Ticket price'),
                PriceField(
                  controller: controller,
                  onChanged: onChanged,
                ),
                const SizedBox(height: 16),
                PrimaryButton(
                  title: 'Next',
                  active: active,
                  onPressed: () {
                    context.push('/plan-hotel');
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
