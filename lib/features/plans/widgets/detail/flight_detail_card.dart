import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/config/app_colors.dart';
import '../../models/plan.dart';
import '../plans_country.dart';
import 'edit_button.dart';

class FlightDetailCard extends StatefulWidget {
  const FlightDetailCard({super.key, required this.plan});

  final Plan plan;

  @override
  State<FlightDetailCard> createState() => _FlightDetailCardState();
}

class _FlightDetailCardState extends State<FlightDetailCard> {
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
                          'Flight',
                          style: TextStyle(
                            color: AppColors.primaryWhite40,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${widget.plan.departure.country} - ${widget.plan.arrival.country}',
                          style: const TextStyle(
                            color: AppColors.primaryWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
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
                            'Ticket price',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.primaryWhite40,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          '${widget.plan.ticketPrice}\$',
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
            title: 'Flights',
            onEdit: () {},
          ),
          _PriceAndTime(plan: widget.plan),
          const SizedBox(height: 5),
          _FlightCard(
            plan: widget.plan,
          ),
          const SizedBox(height: 5),
          _FlightCard(
            plan: widget.plan,
            arrival: true,
          ),
        ],
      ],
    );
  }
}

class _PriceAndTime extends StatelessWidget {
  const _PriceAndTime({required this.plan});

  final Plan plan;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryWhite8,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          PlansCountry(plan: plan),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  height: 66,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryWhite8,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Ticket price',
                            style: TextStyle(
                              color: AppColors.primaryWhite40,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        '${plan.ticketPrice}\$',
                        style: const TextStyle(
                          color: AppColors.primaryWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 66,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryWhite8,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Time flighting',
                            style: TextStyle(
                              color: AppColors.primaryWhite40,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        plan.departure.time,
                        style: const TextStyle(
                          color: AppColors.primaryWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _FlightCard extends StatelessWidget {
  const _FlightCard({
    required this.plan,
    this.arrival = false,
  });

  final Plan plan;
  final bool arrival;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite8,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/plane.svg'),
              const SizedBox(width: 4),
              Text(
                arrival ? 'Arrival' : 'Departure',
                style: const TextStyle(
                  color: AppColors.accent,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      arrival ? plan.arrival.city : plan.departure.city,
                      style: TextStyle(
                        color: AppColors.primaryWhite40,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      arrival ? plan.arrival.country : plan.departure.country,
                      style: const TextStyle(
                        color: AppColors.primaryWhite,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Container(
                width: 120,
                height: 66,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryWhite8,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Time departure',
                          style: TextStyle(
                            color: AppColors.primaryWhite40,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      arrival ? plan.arrival.time : plan.departure.time,
                      style: const TextStyle(
                        color: AppColors.primaryWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 66,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryWhite8,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Airport',
                            style: TextStyle(
                              color: AppColors.primaryWhite40,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        arrival ? plan.arrival.airport : plan.departure.airport,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: AppColors.primaryWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
