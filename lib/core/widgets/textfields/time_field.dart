import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class TimeField extends StatelessWidget {
  const TimeField({
    super.key,
    required this.controller,
    this.hintText = '',
    this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: GestureDetector(
        onTap: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) => Container(
              height: 214,
              color: AppColors.primaryWhite8,
              child: SafeArea(
                top: false,
                child: CupertinoTheme(
                  data: const CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      pickerTextStyle: TextStyle(
                        color: AppColors.primaryWhite,
                      ),
                      primaryColor: AppColors.accent,
                    ),
                  ),
                  child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    mode: CupertinoDatePickerMode.time,
                    use24hFormat: false,
                    onDateTimeChanged: (DateTime newTime) {},
                  ),
                ),
              ),
            ),
          );
        },
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          enabled: false,
          style: const TextStyle(
            color: AppColors.primaryWhite,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.primaryWhite8,
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.primaryWhite40,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(16),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(16),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onChanged: onChanged,
        ),
      ),
    );
  }
}
