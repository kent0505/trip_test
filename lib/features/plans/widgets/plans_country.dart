import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../models/plan.dart';

class PlansCountry extends StatelessWidget {
  const PlansCountry({super.key, required this.plan});

  final Plan plan;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                plan.departure.city,
                style: TextStyle(
                  color: AppColors.primaryWhite40,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                plan.departure.country,
                style: const TextStyle(
                  color: AppColors.primaryWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        SvgPicture.asset('assets/icons/plane3.svg'),
        const Spacer(),
        SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                plan.arrival.city,
                style: TextStyle(
                  color: AppColors.primaryWhite40,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                plan.arrival.country,
                style: const TextStyle(
                  color: AppColors.primaryWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
