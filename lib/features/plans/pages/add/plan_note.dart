import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/textfields/txt_field.dart';
import '../../bloc/plan_bloc.dart';
import '../../widgets/stage_title.dart';

class PlanNote extends StatefulWidget {
  const PlanNote({super.key});

  @override
  State<PlanNote> createState() => _PlanNoteState();
}

class _PlanNoteState extends State<PlanNote> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: 'Add plan',
          subtitle: 'Notes',
          onSkip: () {
            context.pop();
          },
          onPressed: () {
            context.read<PlanBloc>().add(PlanHotelEvent());
          },
        ),
        const SizedBox(height: 8),
        StageTitle(
          title: 'Note',
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              TxtField(
                controller: controller1,
                hintText: 'Description notes',
              ),
              const SizedBox(height: 8),
              TxtField(
                controller: controller2,
                hintText: 'Price',
              ),
              const SizedBox(height: 8),
              Text(
                'If you don’t plan to spend, you don’t have to specify a price. ',
                style: TextStyle(
                  color: AppColors.primaryWhite40,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
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
