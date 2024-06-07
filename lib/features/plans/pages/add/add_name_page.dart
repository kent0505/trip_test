import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils.dart';
import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/textfields/txt_field.dart';
import '../../bloc/plan_bloc.dart';
import '../../models/flight.dart';
import '../../models/hotel.dart';
import '../../models/note.dart';
import '../../models/plan.dart';
import '../../widgets/add/stage_title.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
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
    // context.push('/plan-departure');
    context.read<PlanBloc>().add(
          AddPlanEvent(
            plan: Plan(
              id: getCurrentTimestamp(),
              name: 'Travel to USA',
              departure: Flight(
                country: 'Uzbekistan',
                city: 'Tashkent',
                time: '12:20',
                airport: 'Islam Karimov International Airport',
              ),
              arrival: Flight(
                country: 'USA',
                city: 'New-York',
                time: '00:20',
                airport: 'John F. Kennedy International Airport',
              ),
              ticketPrice: 500,
              hotel: Hotel(
                name: 'HotelName',
                price: 500,
              ),
              notes: [
                Note(description: 'Note one', price: 20),
                Note(description: 'Note two', price: 30),
              ],
            ),
          ),
        );
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
                BlocListener<PlanBloc, PlanState>(
                  listener: (context, state) {
                    if (state is PlansLoadedState) {
                      context.go('/home');
                    }
                  },
                  child: PrimaryButton(
                    title: 'Next',
                    active: active,
                    onPressed: onNext,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
