import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_test/core/widgets/dialogs/dialog_widget.dart';

import '../../../core/widgets/appbar/custom_appbar.dart';
import '../bloc/plan_bloc.dart';
import '../models/plan.dart';
import '../widgets/detail/flight_detail_card.dart';
import '../widgets/detail/hotel_detail_card.dart';
import '../widgets/detail/not_added_card.dart';
import '../widgets/detail/note_detail_card.dart';
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
              title: 'Plan',
              subtitle: plan.name,
              onDelete: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DialogWidget(
                      title: 'Delete?',
                      onPressed: () {
                        context
                            .read<PlanBloc>()
                            .add(DeletePlanEvent(id: plan.id));
                        context.pop();
                      },
                    );
                  },
                );
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
                  if (plan.hotel.name.isEmpty)
                    NotAddedCard(
                      title: 'You don’t have any added hotels',
                      subtitle: 'Add to hotel to plan your trip.',
                      onPressed: () {
                        context.push('/edit-hotel', extra: plan);
                      },
                    )
                  else
                    HotelDetailCard(plan: plan),
                  const SizedBox(height: 16),
                  if (plan.notes.isEmpty)
                    NotAddedCard(
                      title: 'You don’t have any notes added',
                      subtitle: 'Add to notes to plan your trip.',
                      note: true,
                      onPressed: () {
                        context.push('/edit-note', extra: plan);
                      },
                    )
                  else
                    NoteDetailCard(plan: plan),
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
