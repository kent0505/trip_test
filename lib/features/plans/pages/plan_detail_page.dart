import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../core/widgets/appbar/custom_appbar.dart';
import '../models/plan.dart';
import '../widgets/detail/detail_card.dart';
import '../widgets/detail/total_price_card.dart';

class PlanDetailPage extends StatelessWidget {
  const PlanDetailPage({super.key, required this.plan});

  final Plan plan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: 'Add plan',
              subtitle: plan.name,
              onPressed: () {
                context.pop();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  TotalPriceCard(plan: plan),
                  const SizedBox(height: 8),
                  DetailCard(plan: plan, flight: true),
                  const SizedBox(height: 16),
                  DetailCard(plan: plan, hotel: true),
                  const SizedBox(height: 16),
                  DetailCard(plan: plan, notes: true),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
