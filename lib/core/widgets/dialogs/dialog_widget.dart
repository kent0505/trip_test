import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/app_colors.dart';
import '../buttons/txt_button.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.title,
    this.yesText = 'YES',
    this.noText = 'CANCEL',
    this.height = 150,
    this.children = const [],
    required this.onPressed,
  });

  final String title;
  final String yesText;
  final String noText;
  final double height;
  final List<Widget> children;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.bg,
      child: SizedBox(
        height: height,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.primaryWhite,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            ...children,
            const Spacer(),
            Row(
              children: [
                const SizedBox(width: 30),
                TxtButton(
                  title: noText,
                  onPressed: () {
                    context.pop();
                  },
                ),
                const Spacer(),
                TxtButton(
                  title: yesText,
                  onPressed: () {
                    context.pop();
                    onPressed();
                  },
                ),
                const SizedBox(width: 30),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
