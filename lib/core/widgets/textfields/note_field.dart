import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class NoteField extends StatelessWidget {
  const NoteField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 400,
      height: 120,
      child: TextField(
        controller: controller,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.multiline,
        minLines: 6,
        maxLines: null,
        textInputAction: TextInputAction.newline,
        style: const TextStyle(
          color: AppColors.primaryWhite,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.primaryWhite8,
          hintText: 'Description notes',
          hintStyle: TextStyle(
            color: AppColors.primaryWhite40,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          focusedBorder: OutlineInputBorder(
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
    );
  }
}
