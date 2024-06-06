import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/appbar/home_appbar.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../models/plan.dart';
import '../widgets/plan_card.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({super.key, required this.plans});

  final List<Plan> plans;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeAppBar(title: 'Planned trips'),
        Expanded(
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
              for (Plan plan in plans) ...[
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
                  context.push('/plan-name');
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        const SizedBox(height: 83)
      ],
    );
  }
}
