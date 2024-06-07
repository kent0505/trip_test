import 'package:flutter/material.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/widgets/buttons/primary_button.dart';

class NotAddedCard extends StatelessWidget {
  const NotAddedCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.note = false,
    required this.onPressed,
  });

  final String title;
  final String subtitle;
  final bool note;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite8,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.primaryWhite,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              color: AppColors.primaryWhite40,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          note
              ? PrimaryButton(
                  title: 'Add note',
                  svg: 'note_white',
                  borderRadius: 12,
                  onPressed: onPressed,
                )
              : PrimaryButton(
                  title: 'Add hotel',
                  icon: Icons.hotel_outlined,
                  borderRadius: 12,
                  onPressed: onPressed,
                ),
        ],
      ),
    );
  }
}
