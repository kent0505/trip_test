import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/utils.dart';
import '../../models/plan.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({
    super.key,
    required this.plan,
    this.flight = false,
    this.hotel = false,
    this.notes = false,
  });

  final Plan plan;
  final bool flight;
  final bool hotel;
  final bool notes;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryWhite8,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          if (flight) ...[
            _Title(
              title: plan.departure.city,
              subtitle: plan.departure.country,
            ),
            const SizedBox(height: 8),
            _Price(
              title: 'Total amount of travel',
              price: plan.ticketPrice,
            ),
          ] else if (hotel) ...[
            _Title(
              title: 'Hotel',
              subtitle: plan.hotel.name,
            ),
            const SizedBox(height: 8),
            _Price(
              title: 'Price per day',
              price: plan.hotel.price,
            ),
          ] else if (notes) ...[
            const _Title(
              title: 'Notes',
              subtitle: 'The rest of the time spend',
            ),
            const SizedBox(height: 8),
            _Price(
              title: 'Price',
              price: getPlanNotesAmount(plan),
            ),
          ],
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.primaryWhite40,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                color: AppColors.primaryWhite,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const Spacer(),
        SvgPicture.asset('assets/icons/chevron_down.svg'),
        const SizedBox(width: 16),
      ],
    );
  }
}

class _Price extends StatelessWidget {
  const _Price({
    required this.title,
    required this.price,
  });

  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite8,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.primaryWhite40,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            '$price\$',
            style: const TextStyle(
              color: AppColors.primaryWhite,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
