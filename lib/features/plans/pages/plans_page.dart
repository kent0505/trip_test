import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/appbar/home_appbar.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../bloc/plan_bloc.dart';
import '../models/plan.dart';
import '../widgets/plan_card.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeAppBar(title: 'Planned trips'),
        BlocBuilder<PlanBloc, PlanState>(
          builder: (context, state) {
            if (state is PlansLoadedState) {
              if (state.plans.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: PrimaryButton(
                    title: 'Add plan',
                    icon: Icons.add,
                    onPressed: () {
                      context.push('/add-name');
                    },
                  ),
                );
              }

              return Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      'Plans',
                      style: TextStyle(
                        color: AppColors.primaryWhite40,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    for (Plan plan in state.plans) ...[
                      PlansCard(
                        plan: plan,
                        onPressed: () {
                          context.push('/plan-detail', extra: plan);
                        },
                      ),
                    ],
                    PrimaryButton(
                      title: 'Add plan',
                      icon: Icons.add,
                      onPressed: () {
                        context.push('/add-name');
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              );
            }

            return Container();
          },
        ),
        const SizedBox(height: 83)
      ],
    );
  }
}
