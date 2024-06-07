import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/textfields/price_field.dart';
import '../../models/hotel.dart';
import '../../models/plan.dart';
import '../../widgets/add/stage_title.dart';

class AddTicketPage extends StatefulWidget {
  const AddTicketPage({super.key, required this.plan});

  final Plan plan;

  @override
  State<AddTicketPage> createState() => _AddTicketPageState();
}

class _AddTicketPageState extends State<AddTicketPage> {
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
      '/add-hotel',
      extra: Plan(
        id: widget.plan.id,
        name: widget.plan.name,
        departure: widget.plan.departure,
        arrival: widget.plan.arrival,
        ticketPrice: double.tryParse(controller.text) ?? 0,
        hotel: Hotel(name: '', price: 0),
        notes: [],
      ),
    );
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
            title: 'Add plan',
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
