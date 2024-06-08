import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/dialogs/dialog_widget.dart';
import '../../../../core/widgets/textfields/price_field.dart';
import '../../../../core/widgets/textfields/txt_field.dart';
import '../../bloc/plan_bloc.dart';
import '../../models/hotel.dart';
import '../../models/plan.dart';
import '../../widgets/add/stage_title.dart';

class EditHotelPage extends StatefulWidget {
  const EditHotelPage({super.key, required this.plan});

  final Plan plan;

  @override
  State<EditHotelPage> createState() => _EditHotelPageState();
}

class _EditHotelPageState extends State<EditHotelPage> {
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

  void onEdit() {
    context.read<PlanBloc>().add(
          EditPlanEvent(
            plan: Plan(
              id: widget.plan.id,
              name: widget.plan.name,
              departure: widget.plan.departure,
              arrival: widget.plan.arrival,
              ticketPrice: widget.plan.ticketPrice,
              hotel: Hotel(
                name: controller1.text,
                price: int.tryParse(controller2.text) ?? 0,
              ),
              notes: widget.plan.notes,
            ),
          ),
        );
    context.pop();
  }

  void onDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogWidget(
          title: 'Delete hotel?',
          onPressed: () {
            context.read<PlanBloc>().add(
                  EditPlanEvent(
                    plan: Plan(
                      id: widget.plan.id,
                      name: widget.plan.name,
                      departure: widget.plan.departure,
                      arrival: widget.plan.arrival,
                      ticketPrice: widget.plan.ticketPrice,
                      hotel: Hotel(name: '', price: 0),
                      notes: widget.plan.notes,
                    ),
                  ),
                );
            context.pop();
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.plan.hotel.name.isNotEmpty) {
      controller1.text = widget.plan.hotel.name;
      controller2.text = widget.plan.hotel.price.toString();
      active = true;
    }
  }

  @override
  void dispose() {
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
            title: widget.plan.hotel.name.isNotEmpty ? 'Edit plan' : 'Add plan',
            subtitle: 'Hotel',
            onDelete: widget.plan.hotel.name.isNotEmpty ? onDelete : null,
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
                  title: widget.plan.hotel.name.isNotEmpty ? 'Edit' : 'Add',
                  active: active,
                  onPressed: onEdit,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
