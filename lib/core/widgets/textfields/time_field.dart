import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class TimeField extends StatelessWidget {
  const TimeField({
    super.key,
    required this.controller,
    this.hintText = '',
    this.onChanged,
    this.onTap,
  });

  final TextEditingController controller;
  final String hintText;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: GestureDetector(
        onTap: onTap,
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
