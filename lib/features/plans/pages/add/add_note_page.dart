import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/textfields/note_field.dart';
import '../../../../core/widgets/textfields/price_field.dart';
import '../../bloc/plan_bloc.dart';
import '../../models/note.dart';
import '../../models/plan.dart';
import '../../widgets/add/stage_title.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key, required this.plan});

  final Plan plan;

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  List<TextEditingController> controllers1 = [];
  List<TextEditingController> controllers2 = [];

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

  void onRemove() {
    setState(() {
      noteCount--;
      controllers1.removeLast();
      controllers2.removeLast();
    });
  }

  void onAdd() {
    setState(() {
      noteCount++;
      controllers1.add(TextEditingController());
      controllers2.add(TextEditingController());
    });
  }

  void onSkip() {
    context.read<PlanBloc>().add(
          AddPlanEvent(
            plan: Plan(
              id: widget.plan.id,
              name: widget.plan.name,
              departure: widget.plan.departure,
              arrival: widget.plan.arrival,
              ticketPrice: widget.plan.ticketPrice,
              hotel: widget.plan.hotel,
              notes: [],
            ),
          ),
        );
    context.go('/home');
  }

  void onSave() {
    context.read<PlanBloc>().add(
          AddPlanEvent(
            plan: Plan(
              id: widget.plan.id,
              name: widget.plan.name,
              departure: widget.plan.departure,
              arrival: widget.plan.arrival,
              ticketPrice: widget.plan.ticketPrice,
              hotel: widget.plan.hotel,
              notes: List<Note>.generate(
                noteCount,
                (index) {
                  return Note(
                    description: controllers1[index].text,
                    price: double.tryParse(controllers2[index].text) ?? 0,
                  );
                },
              ),
            ),
          ),
        );
    context.go('/home');
    // for (var con in controllers1) {
    //   print(con.text);
    // }
    // for (var con in controllers2) {
    //   print(con.text);
    // }
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < noteCount; i++) {
      controllers1.add(TextEditingController());
      controllers2.add(TextEditingController());
    }
    log('Controllers len = ${controllers1.length}');
    log('Controllers len = ${controllers2.length}');
  }

  @override
  void dispose() {
    log('DISPOSE PLAN NOTE PAGE');
    for (var controller in controllers1) {
      controller.dispose();
    }
    for (var controller in controllers2) {
      controller.dispose();
    }
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
            onSkip: onSkip,
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
                          onRemove: onRemove,
                          onAdd: onAdd,
                        ),
                        NoteField(
                          controller: controllers1[index],
                          onChanged: onChanged,
                        ),
                        const SizedBox(height: 8),
                        PriceField(controller: controllers2[index]),
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
                  title: 'Save',
                  active: active,
                  onPressed: onSave,
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
