import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/appbar/custom_appbar.dart';

class PlanDetailPage extends StatelessWidget {
  const PlanDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Add plan',
            subtitle: 'Start',
            onPressed: () {
              context.pop();
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  'Name plan',
                  style: TextStyle(
                    color: AppColors.primaryWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                // TxtField(controller: controller1),
                // const SizedBox(height: 16),
                // PrimaryButton(
                //   title: 'Next',
                //   active: true,
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
