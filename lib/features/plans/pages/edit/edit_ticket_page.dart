import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/textfields/price_field.dart';
import '../../bloc/plan_bloc.dart';
import '../../models/plan.dart';
import '../../widgets/add/stage_title.dart';

class EditTicketPage extends StatefulWidget {
  const EditTicketPage({super.key, required this.plan});

  final Plan plan;

  @override
  State<EditTicketPage> createState() => _EditTicketPageState();
}

class _EditTicketPageState extends State<EditTicketPage> {
  final controller = TextEditingController();

  bool active = true;

  void onChanged(String text) {
    if (text.isEmpty) {
      if (!active) return;
      setState(() => active = false);
    } else {
      if (active) return;
      setState(() => active = true);
    }
  }

  void onSave() {
    context.read<PlanBloc>().add(
          EditPlanEvent(
            plan: Plan(
              id: widget.plan.id,
              name: widget.plan.name,
              departure: widget.plan.departure,
              arrival: widget.plan.arrival,
              ticketPrice: double.tryParse(controller.text) ?? 0,
              hotel: widget.plan.hotel,
              notes: widget.plan.notes,
            ),
          ),
        );
    context.go('/home');
  }

  @override
  void initState() {
    super.initState();
    controller.text = widget.plan.ticketPrice.toString();
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
          const CustomAppBar(
            title: 'Edit plan',
            subtitle: 'Flight',
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
                  title: 'Save',
                  active: active,
                  onPressed: onSave,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
