import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/plan_bloc.dart';
import 'add/plan_name.dart';
import 'add/plan_departure.dart';
import 'add/plan_arrival.dart';
import 'add/plan_note.dart';
import 'add/plan_ticket.dart';
import 'add/plan_hotel.dart';

class AddPlanPage extends StatefulWidget {
  const AddPlanPage({super.key});

  @override
  State<AddPlanPage> createState() => _AddPlanPageState();
}

class _AddPlanPageState extends State<AddPlanPage> {
  @override
  void initState() {
    super.initState();
    context.read<PlanBloc>().add(PlanNameEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PlanBloc, PlanState>(
        builder: (context, state) {
          if (state is PlanInitial) {
            return const PlanName();
          }

          if (state is PlanDepartureState) {
            return const PlanDeparture();
          }

          if (state is PlanArrivalState) {
            return const PlanArrival();
          }

          if (state is PlanTicketState) {
            return const PlanTicket();
          }

          if (state is PlanHotelState) {
            return const PlanHotel();
          }

          if (state is PlanNoteState) {
            return const PlanNote();
          }

          return Container();
        },
      ),
    );
  }
}
