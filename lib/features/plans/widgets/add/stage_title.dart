import 'package:flutter/cupertino.dart';

import '../../../../core/config/app_colors.dart';

class StageTitle extends StatelessWidget {
  const StageTitle({
    super.key,
    required this.title,
    this.index = 0,
    this.onAdd,
    this.onRemove,
  });

  final String title;
  final int index;
  final void Function()? onAdd;
  final void Function()? onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 22,
        // width: 400,
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
            if (onAdd != null) ...[
              if (index >= 1) ...[
                CupertinoButton(
                  onPressed: onRemove,
                  padding: EdgeInsets.zero,
                  child: const Text(
                    'Remove',
                    style: TextStyle(
                      color: AppColors.accent,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
              CupertinoButton(
                onPressed: onAdd,
                padding: EdgeInsets.zero,
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: AppColors.accent,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
