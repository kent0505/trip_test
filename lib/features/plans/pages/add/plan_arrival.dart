import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/textfields/txt_field.dart';
import '../../bloc/plan_bloc.dart';
import '../../widgets/stage_title.dart';

class PlanArrival extends StatefulWidget {
  const PlanArrival({super.key});

  @override
  State<PlanArrival> createState() => _PlanArrivalState();
}

class _PlanArrivalState extends State<PlanArrival> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: 'Add plan',
          subtitle: 'Flight',
          onPressed: () {
            context.read<PlanBloc>().add(PlanDepartureEvent());
          },
        ),
        const SizedBox(height: 8),
        const StageTitle(title: 'Arrival'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              TxtField(
                controller: controller1,
                hintText: 'Country',
              ),
              const SizedBox(height: 8),
              TxtField(
                controller: controller1,
                hintText: 'City',
              ),
              const SizedBox(height: 8),
              TxtField(
                controller: controller1,
                hintText: '00:00',
              ),
              const SizedBox(height: 8),
              TxtField(
                controller: controller1,
                hintText: 'Airport',
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                title: 'Next',
                active: true,
                onPressed: () {
                  context.read<PlanBloc>().add(PlanTicketEvent());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
