import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/config/app_colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 6),
        const Text(
          'Settings',
          style: TextStyle(
            color: AppColors.primaryWhite,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 26),
        _SettingsTile(
          title: 'Share with friends',
          icon: 'share',
          onPressed: () {},
        ),
        const SizedBox(height: 8),
        _SettingsTile(
          title: 'Terms of use',
          icon: 'note',
          onPressed: () {},
        ),
        const SizedBox(height: 8),
        _SettingsTile(
          title: 'Privacy Policy',
          icon: 'lock',
          onPressed: () {},
        ),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  final String title;
  final String icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.primaryWhite8,
        borderRadius: BorderRadius.circular(16),
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/icons/$icon.svg'),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.primaryWhite,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.chevron_right,
              color: AppColors.accent,
            ),
          ],
        ),
      ),
    );
  }
}
