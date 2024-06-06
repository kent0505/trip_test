import 'package:flutter/cupertino.dart';

import '../../../../core/config/app_colors.dart';

class StageTitle extends StatelessWidget {
  const StageTitle({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        height: 22,
        width: 432,
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.primaryWhite,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            onPressed != null
                ? CupertinoButton(
                    onPressed: onPressed,
                    padding: EdgeInsets.zero,
                    child: const Row(
                      children: [
                        Text(
                          'Add',
                          style: TextStyle(
                            color: AppColors.accent,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
