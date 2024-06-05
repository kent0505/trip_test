import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';

class PlansCard extends StatelessWidget {
  const PlansCard({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        color: AppColors.primaryWhite8,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const _PlansTitle(title: 'Travel to Italy'),
          Divider(
            height: 1,
            color: AppColors.primaryWhite8,
          ),
          const SizedBox(height: 12),
          const _PlansCountry(
            fromCity: 'Paris',
            fromCountry: 'France',
            toCity: 'Rome',
            toCountry: 'Italy',
          ),
          const SizedBox(height: 24),
          const _PlansPrice(price: 2025),
          const SizedBox(height: 8),
          _PlansCardButton(onPressed: onPressed),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _PlansTitle extends StatelessWidget {
  const _PlansTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.primaryWhite,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          SvgPicture.asset('assets/icons/plane2.svg'),
        ],
      ),
    );
  }
}

class _PlansCountry extends StatelessWidget {
  const _PlansCountry({
    required this.fromCity,
    required this.fromCountry,
    required this.toCity,
    required this.toCountry,
  });

  final String fromCity;
  final String fromCountry;
  final String toCity;
  final String toCountry;

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
                fromCity,
                style: TextStyle(
                  color: AppColors.primaryWhite40,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                fromCountry,
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
                toCity,
                style: TextStyle(
                  color: AppColors.primaryWhite40,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                toCountry,
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

class _PlansPrice extends StatelessWidget {
  const _PlansPrice({
    required this.price,
  });

  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite8,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Text(
            'Total amount of travel',
            style: TextStyle(
              color: AppColors.primaryWhite40,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
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

class _PlansCardButton extends StatelessWidget {
  const _PlansCardButton({
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.accent14,
        borderRadius: BorderRadius.circular(12),
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Open full plan',
              style: TextStyle(
                color: AppColors.accent,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
