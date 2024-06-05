import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/textfields/txt_field.dart';
import '../../bloc/plan_bloc.dart';
import '../../widgets/stage_title.dart';

class PlanTicket extends StatefulWidget {
  const PlanTicket({super.key});

  @override
  State<PlanTicket> createState() => _PlanTicketState();
}

class _PlanTicketState extends State<PlanTicket> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
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
            context.read<PlanBloc>().add(PlanArrivalEvent());
          },
        ),
        const SizedBox(height: 8),
        const StageTitle(title: 'Ticket price'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              TxtField(
                controller: controller,
                hintText: 'Price',
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                title: 'Next',
                active: true,
                onPressed: () {
                  context.read<PlanBloc>().add(PlanHotelEvent());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
