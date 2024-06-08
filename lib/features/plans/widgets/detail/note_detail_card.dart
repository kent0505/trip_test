import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_test/core/utils.dart';

import '../../../../core/config/app_colors.dart';
import '../../models/note.dart';
import '../../models/plan.dart';
import 'edit_button.dart';

class NoteDetailCard extends StatefulWidget {
  const NoteDetailCard({super.key, required this.plan});

  final Plan plan;

  @override
  State<NoteDetailCard> createState() => _NoteDetailCardState();
}

class _NoteDetailCardState extends State<NoteDetailCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryWhite8,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notes',
                          style: TextStyle(
                            color: AppColors.primaryWhite40,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          'The rest of the time spend',
                          style: TextStyle(
                            color: AppColors.primaryWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    AnimatedRotation(
                      turns: expanded ? 1 / 2 : 1,
                      duration: const Duration(milliseconds: 300),
                      child: SvgPicture.asset('assets/icons/chevron_down.svg'),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
                if (!expanded) ...[
                  const SizedBox(height: 8),
                  Container(
                    height: 46,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.primaryWhite8,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Price',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.primaryWhite40,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          '${getPlanNotesAmount(widget.plan)}',
                          style: const TextStyle(
                            color: AppColors.primaryWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 16),
              ],
            ),
          ),
          onPressed: () {
            setState(() {
              expanded = !expanded;
            });
          },
        ),
        if (expanded) ...[
          EditButton(
            title: 'Notes',
            onEdit: () {
              context.push('/edit-note', extra: widget.plan);
            },
          ),
          for (Note note in widget.plan.notes) ...[
            _NoteExpandedCard(note: note)
          ]
        ],
      ],
    );
  }
}

class _NoteExpandedCard extends StatelessWidget {
  const _NoteExpandedCard({required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite8,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            note.description,
            style: const TextStyle(
              color: AppColors.primaryWhite,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 46,
            decoration: BoxDecoration(
              color: AppColors.primaryWhite8,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Price',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.primaryWhite40,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  '${note.price}\$',
                  style: const TextStyle(
                    color: AppColors.primaryWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
