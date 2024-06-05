import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/textfields/txt_field.dart';
import '../../bloc/plan_bloc.dart';
import '../../widgets/stage_title.dart';

class PlanName extends StatefulWidget {
  const PlanName({super.key});

  @override
  State<PlanName> createState() => _PlanNameState();
}

class _PlanNameState extends State<PlanName> {
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
          subtitle: 'Start',
          onPressed: () {
            context.pop();
          },
        ),
        const SizedBox(height: 8),
        const StageTitle(title: 'Name plan'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              TxtField(
                controller: controller,
                hintText: 'Name',
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                title: 'Next',
                active: true,
                onPressed: () {
                  context.read<PlanBloc>().add(PlanDepartureEvent());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
