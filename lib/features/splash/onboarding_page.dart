import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/widgets/buttons/primary_button.dart';
import '../../core/widgets/buttons/txt_button.dart';
import 'widgets/logo_widget.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(
        "${MediaQuery.of(context).size.height} X ${MediaQuery.of(context).size.width}");

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Spacer(),
            const LogoWidget(),
            const SizedBox(height: 10),
            const Text(
              'Maximize your trip\nWith our app!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryWhite,
                fontSize: 32,
                fontWeight: FontWeight.w800,
                fontFamily: 'SFProTextMedium',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'booking, route planning, and expense\ntracking - all in one place!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryWhite40,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            const Spacer(),
            PrimaryButton(
              title: 'Get started',
              borderRadius: 12,
              onPressed: () {
                context.go('/home');
              },
            ),
            const SizedBox(height: 24),
            TxtButton(
              title: 'Terms of Use / Privacy Policy',
              onPressed: () {},
            ),
            const SizedBox(height: 56),
          ],
        ),
      ),
    );
  }
}
