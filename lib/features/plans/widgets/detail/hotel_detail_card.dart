import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_colors.dart';
import '../../models/plan.dart';
import 'edit_button.dart';

class HotelDetailCard extends StatefulWidget {
  const HotelDetailCard({super.key, required this.plan});

  final Plan plan;

  @override
  State<HotelDetailCard> createState() => _HotelDetailCardState();
}

class _HotelDetailCardState extends State<HotelDetailCard> {
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
                          'Hotel',
                          style: TextStyle(
                            color: AppColors.primaryWhite40,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.plan.hotel.name,
                          style: const TextStyle(
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
                            'Price per day',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.primaryWhite40,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          '${widget.plan.hotel.price}\$',
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
            title: 'Hotels',
            onEdit: () {
              context.push('/edit-hotel', extra: widget.plan);
            },
          ),
          _HotelExpandedCard(plan: widget.plan)
        ],
      ],
    );
  }
}

class _HotelExpandedCard extends StatelessWidget {
  const _HotelExpandedCard({
    required this.plan,
  });

  final Plan plan;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite8,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                plan.arrival.city,
                style: TextStyle(
                  color: AppColors.primaryWhite40,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                plan.hotel.name,
                style: const TextStyle(
                  color: AppColors.primaryWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SFProTextMedium',
                ),
              ),
            ],
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
                    'Price per day',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.primaryWhite40,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  '${plan.hotel.price}\$',
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
