import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'plan_event.dart';
part 'plan_state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  PlanBloc() : super(PlanInitial()) {
    on<PlanNameEvent>((event, emit) {
      log('PlanInitial');
      emit(PlanInitial());
    });

    on<PlanDepartureEvent>((event, emit) {
      log('PlanDepartureState');
      emit(PlanDepartureState());
    });

    on<PlanArrivalEvent>((event, emit) {
      log('PlanArrivalState');
      emit(PlanArrivalState());
    });

    on<PlanTicketEvent>((event, emit) {
      log('PlanTicketState');
      emit(PlanTicketState());
    });

    on<PlanHotelEvent>((event, emit) {
      log('PlanHotelState');
      emit(PlanHotelState());
    });

    on<PlanNoteEvent>((event, emit) {
      log('PlanNoteState');
      emit(PlanNoteState());
    });
  }
}
