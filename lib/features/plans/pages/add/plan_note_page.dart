import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/textfields/note_field.dart';
import '../../../../core/widgets/textfields/price_field.dart';
import '../../widgets/add/stage_title.dart';

class PlanNotePage extends StatefulWidget {
  const PlanNotePage({super.key});

  @override
  State<PlanNotePage> createState() => _PlanNotePageState();
}

class _PlanNotePageState extends State<PlanNotePage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  bool active = false;
  int noteCount = 1;

  void onChanged(String text) {
    if (text.isEmpty) {
      if (!active) return;
      setState(() => active = false);
    } else {
      if (active) return;
      setState(() => active = true);
    }
  }

  @override
  void dispose() {
    log('DISPOSE PLAN NOTE PAGE');
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Add plan',
            subtitle: 'Notes',
            onPressed: () {
              context.pop();
            },
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                ...List.generate(
                  noteCount,
                  (index) {
                    return Column(
                      children: [
                        StageTitle(
                          title: 'Note',
                          index: index,
                          onRemove: () {
                            setState(() {
                              noteCount--;
                            });
                          },
                          onAdd: () {
                            setState(() {
                              noteCount++;
                            });
                          },
                        ),
                        NoteField(
                          controller: controller1,
                          onChanged: onChanged,
                        ),
                        const SizedBox(height: 8),
                        PriceField(controller: controller2),
                        const SizedBox(height: 8),
                        Text(
                          'If you don’t plan to spend, you don’t have to specify a price. ',
                          style: TextStyle(
                            color: AppColors.primaryWhite40,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  },
                ),
                PrimaryButton(
                  title: 'Next',
                  active: active,
                  onPressed: () {
                    // context.push('/plan-note');
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
