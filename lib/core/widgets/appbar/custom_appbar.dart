import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/app_colors.dart';
import '../buttons/ico_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.subtitle = '',
    this.onSkip,
    this.onDelete,
  });

  final String title;
  final String subtitle;
  final void Function()? onSkip;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 44,
        child: Row(
          children: [
            IcoButton(
              onPressed: () {
                context.pop();
              },
              icon: Icons.arrow_back,
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.primaryWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle.isNotEmpty
                    ? Text(
                        subtitle,
                        style: TextStyle(
                          color: AppColors.primaryWhite40,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : Container(),
              ],
            ),
            const Spacer(),
            if (onSkip != null) ...[
              CupertinoButton(
                onPressed: onSkip,
                padding: const EdgeInsets.only(right: 22),
                child: const SizedBox(
                  height: 44,
                  child: Center(
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: AppColors.accent,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ] else if (onDelete != null)
              CupertinoButton(
                onPressed: onDelete,
                padding: const EdgeInsets.only(right: 22),
                child: const SizedBox(
                  height: 44,
                  child: Center(
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        color: AppColors.accent,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
            else
              const SizedBox(width: 44),
          ],
        ),
      ),
    );
  }
}
