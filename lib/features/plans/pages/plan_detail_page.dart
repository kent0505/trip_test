import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:trip_test/features/plans/widgets/detail/hotel_detail_card.dart';

import '../../../core/widgets/appbar/custom_appbar.dart';
import '../models/plan.dart';
import '../widgets/detail/flight_detail_card.dart';
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
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const SizedBox(height: 16),
                  TotalPriceCard(plan: plan),
                  const SizedBox(height: 8),
                  FlightDetailCard(plan: plan),
                  const SizedBox(height: 16),
                  HotelDetailCard(plan: plan),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
