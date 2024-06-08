import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/textfields/price_field.dart';
import '../../../../core/widgets/textfields/txt_field.dart';
import '../../bloc/plan_bloc.dart';
import '../../models/hotel.dart';
import '../../models/plan.dart';
import '../../widgets/add/stage_title.dart';

class AddHotelPage extends StatefulWidget {
  const AddHotelPage({super.key, required this.plan});

  final Plan plan;

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

  void onSkip() {
    context.read<PlanBloc>().add(
          AddPlanEvent(
            plan: Plan(
              id: widget.plan.id,
              name: widget.plan.name,
              departure: widget.plan.departure,
              arrival: widget.plan.arrival,
              ticketPrice: widget.plan.ticketPrice,
              hotel: Hotel(name: '', price: 0),
              notes: [],
            ),
          ),
        );
    context.go('/home');
  }

  void onNext() {
    context.push(
      '/add-note',
      extra: Plan(
        id: widget.plan.id,
        name: widget.plan.name,
        departure: widget.plan.departure,
        arrival: widget.plan.arrival,
        ticketPrice: widget.plan.ticketPrice,
        hotel: Hotel(
          name: controller1.text,
          price: double.tryParse(controller2.text) ?? 0,
        ),
        notes: [],
      ),
    );
  }

  @override
  void dispose() {
    log('DISPOSE ADD HOTEL PAGE');
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
            onSkip: onSkip,
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
