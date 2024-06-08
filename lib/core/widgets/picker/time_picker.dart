import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/app_colors.dart';
import '../../utils.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({
    super.key,
    required this.time,
    required this.onSave,
    required this.onDateTimeChanged,
  });

  final String time;
  final void Function() onSave;
  final void Function(DateTime) onDateTimeChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      decoration: const BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 6),
          Container(
            height: 5,
            width: 36,
            decoration: BoxDecoration(
              color: AppColors.primaryWhite40,
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),
          const SizedBox(height: 6),
          Material(
            color: Colors.transparent,
            child: Row(
              children: [
                const SizedBox(width: 16),
                const Text(
                  'Time',
                  style: TextStyle(
                    color: AppColors.primaryWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                CupertinoButton(
                  onPressed: onSave,
                  padding: EdgeInsets.zero,
                  child: Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                      color: AppColors.primaryWhite8,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: AppColors.accent,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                CupertinoButton(
                  onPressed: () {
                    context.pop();
                  },
                  padding: EdgeInsets.zero,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColors.primaryWhite8,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.close_sharp,
                      color: AppColors.accent,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Container(
            height: 1,
            color: AppColors.primaryWhite8,
          ),
          const Spacer(),
          SizedBox(
            height: 214,
            child: CupertinoTheme(
              data: const CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                  pickerTextStyle: TextStyle(
                    color: AppColors.primaryWhite,
                  ),
                  dateTimePickerTextStyle: TextStyle(
                    color: AppColors.primaryWhite,
                    fontSize: 20,
                  ),
                ),
              ),
              child: CupertinoDatePicker(
                initialDateTime: parseTimeString(time),
                mode: CupertinoDatePickerMode.time,
                use24hFormat: false,
                onDateTimeChanged: onDateTimeChanged,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
