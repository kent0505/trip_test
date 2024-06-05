import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/textfields/txt_field.dart';
import '../../bloc/plan_bloc.dart';
import '../../widgets/stage_title.dart';

class PlanHotel extends StatefulWidget {
  const PlanHotel({super.key});

  @override
  State<PlanHotel> createState() => _PlanHotelState();
}

class _PlanHotelState extends State<PlanHotel> {
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
          subtitle: 'Hotel',
          onSkip: () {
            context.read<PlanBloc>().add(PlanNoteEvent());
          },
          onPressed: () {
            context.read<PlanBloc>().add(PlanTicketEvent());
          },
        ),
        const SizedBox(height: 8),
        const StageTitle(title: 'Hotel'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 8),
              TxtField(
                controller: controller,
                hintText: 'Name hotel',
              ),
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
                  context.read<PlanBloc>().add(PlanNoteEvent());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
