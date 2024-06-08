import 'package:flutter/cupertino.dart';

import '../../../../core/config/app_colors.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.title,
    this.onEdit,
    this.onDelete,
  });

  final String title;
  final void Function()? onEdit;
  final void Function()? onDelete;

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
            if (onDelete != null)
              CupertinoButton(
                onPressed: onDelete,
                padding: EdgeInsets.zero,
                child: const Text(
                  'Delete',
                  style: TextStyle(
                    color: AppColors.accent,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            CupertinoButton(
              onPressed: onEdit,
              padding: EdgeInsets.zero,
              child: const Text(
                'Edit',
                style: TextStyle(
                  color: AppColors.accent,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
