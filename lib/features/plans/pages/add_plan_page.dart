import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/appbar/custom_appbar.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../bloc/plan_bloc.dart';
import '../widgets/add/stage_title.dart';

class AddPlanPage extends StatefulWidget {
  const AddPlanPage({super.key});

  @override
  State<AddPlanPage> createState() => _AddPlanPageState();
}

class _AddPlanPageState extends State<AddPlanPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final controller5 = TextEditingController();
  final controller6 = TextEditingController();
  final controller7 = TextEditingController();
  final controller8 = TextEditingController();
  final controller9 = TextEditingController();
  final controller10 = TextEditingController();
  final controller11 = TextEditingController();
  final controller12 = TextEditingController();

  bool active = false;

  void onChanged(String text) {
    if (text.isEmpty) {
      if (!active) return;
      setState(() => active = false);
    } else {
      if (active) return;
      setState(() => active = true);
    }
  }

  String getAppBarSubtitle(PlanState state) {
    if (state is PlanInitial) {
      return 'Start';
    } else if (state is PlanHotelState) {
      return 'Hotel';
    } else if (state is PlanNoteState) {
      return 'Notes';
    } else {
      return 'Flight';
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<PlanBloc>().add(PlanNameEvent());
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
    controller7.dispose();
    controller8.dispose();
    controller9.dispose();
    controller10.dispose();
    controller11.dispose();
    controller12.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlanBloc, PlanState>(
      builder: (context, state) {
        return PopScope(
          canPop: state is PlanInitial,
          onPopInvoked: (_) {
            context.read<PlanBloc>().add(PlanPreviousEvent());
          },
          child: Scaffold(
            body: Column(
              children: [
                CustomAppBar(
                  title: 'Add plan',
                  subtitle: getAppBarSubtitle(state),
                  onSkip: state is PlanHotelState || state is PlanNoteState
                      ? () {
                          context.pop();
                        }
                      : null,
                  onPressed: () {
                    if (state is PlanInitial) {
                      context.pop();
                    } else {
                      context.read<PlanBloc>().add(PlanPreviousEvent());
                    }
                  },
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: BlocBuilder<PlanBloc, PlanState>(
                    builder: (context, state) {
                      if (state is PlanInitial) {
                        return Column(
                          children: [
                            const StageTitle(title: 'Name plan'),
                            TxtField(
                              controller: controller1,
                              hintText: 'Name',
                              onChanged: onChanged,
                            ),
                          ],
                        );
                      }

                      if (state is PlanDepartureState) {
                        return Column(
                          children: [
                            const StageTitle(title: 'Departure'),
                            TxtField(
                              controller: controller2,
                              hintText: 'Country',
                            ),
                            const SizedBox(height: 8),
                            TxtField(
                              controller: controller3,
                              hintText: 'City',
                            ),
                            const SizedBox(height: 8),
                            TxtField(
                              controller: controller4,
                              hintText: '00:00',
                            ),
                            const SizedBox(height: 8),
                            TxtField(
                              controller: controller5,
                              hintText: 'Airport',
                            ),
                          ],
                        );
                      }

                      if (state is PlanArrivalState) {
                        return Column(
                          children: [
                            const StageTitle(title: 'Arrival'),
                            TxtField(
                              controller: controller6,
                              hintText: 'Country',
                            ),
                            const SizedBox(height: 8),
                            TxtField(
                              controller: controller7,
                              hintText: 'City',
                            ),
                            const SizedBox(height: 8),
                            TxtField(
                              controller: controller8,
                              hintText: '00:00',
                            ),
                            const SizedBox(height: 8),
                            TxtField(
                              controller: controller9,
                              hintText: 'Airport',
                            ),
                          ],
                        );
                      }

                      if (state is PlanTicketState) {
                        return Column(
                          children: [
                            const StageTitle(title: 'Ticket price'),
                            TxtField(
                              controller: controller10,
                              hintText: 'Price',
                            ),
                          ],
                        );
                      }

                      if (state is PlanHotelState) {
                        return Column(
                          children: [
                            const StageTitle(title: 'Hotel'),
                            TxtField(
                              controller: controller11,
                              hintText: 'Name hotel',
                            ),
                            const SizedBox(height: 8),
                            TxtField(
                              controller: controller12,
                              hintText: 'Price',
                            ),
                          ],
                        );
                      }

                      if (state is PlanNoteState) {
                        return Column(
                          children: [
                            StageTitle(
                              title: 'Note',
                              onPressed: () {},
                            ),
                            TxtField(
                              controller: controller11,
                              hintText: 'Description notes',
                            ),
                            const SizedBox(height: 8),
                            TxtField(
                              controller: controller12,
                              hintText: 'Price',
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'If you don’t plan to spend, you don’t have to specify a price. ',
                              style: TextStyle(
                                color: AppColors.primaryWhite40,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        );
                      }

                      return Container();
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: PrimaryButton(
                    title: 'Next',
                    active: active,
                    onPressed: () {
                      context.read<PlanBloc>().add(PlanNextEvent());
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
