import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../models/plan.dart';
import '../widgets/plan_card.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 6),
        const Text(
          'Planned trips',
          style: TextStyle(
            color: AppColors.primaryWhite,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Plans',
          style: TextStyle(
            color: AppColors.primaryWhite40,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        PlansCard(
          plan: Plan(
            id: 1,
            name: 'Travel to Italy',
            departure: Flight(
              country: 'France',
              city: 'Paris',
              time: '22:00',
              airport: 'Paris Airport',
            ),
            arrival: Flight(
              country: 'Italy',
              city: 'Rome',
              time: '12:00',
              airport: 'Rome Airport',
            ),
            ticketPrice: 1500,
            hotel: Hotel(
              name: 'Hotel Name',
              price: 300,
            ),
            notes: [
              Note(
                id: 1,
                description: 'Note desc one',
                price: 46,
              ),
              Note(
                id: 2,
                description: 'Note desc two',
                price: 55.40,
              ),
            ],
          ),
          onPressed: () {
            context.push(
              '/plan-detail',
              extra: Plan(
                id: 1,
                name: 'Travel to Italy',
                departure: Flight(
                  country: 'France',
                  city: 'Paris',
                  time: '22:00',
                  airport: 'Paris Airport',
                ),
                arrival: Flight(
                  country: 'Italy',
                  city: 'Rome',
                  time: '12:00',
                  airport: 'Rome Airport',
                ),
                ticketPrice: 1500,
                hotel: Hotel(
                  name: 'Hotel Name',
                  price: 300,
                ),
                notes: [
                  Note(
                    id: 1,
                    description: 'Note desc one',
                    price: 46,
                  ),
                  Note(
                    id: 2,
                    description: 'Note desc two',
                    price: 55.40,
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 8),
        PrimaryButton(
          title: 'Add plan',
          icon: Icons.add,
          onPressed: () {
            context.push('/plan-add');
          },
        ),
      ],
    );
  }
}
