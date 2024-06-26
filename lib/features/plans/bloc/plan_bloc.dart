import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/plan.dart';
import '../service/plan_service.dart';

part 'plan_event.dart';
part 'plan_state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  final _service = PlanService();
  List<Plan> _plans = [];

  PlanBloc() : super(PlanInitial()) {
    on<GetPlansEvent>((event, emit) async {
      if (_service.plans.isEmpty) {
        _plans = await _service.getPlans();
        emit(PlansLoadedState(plans: _plans));
      } else {
        emit(PlansLoadedState(plans: _plans));
      }
    });

    on<AddPlanEvent>((event, emit) async {
      if (event.plan.name.isNotEmpty) {
        _service.plans.add(event.plan);
        _plans = await _service.updatePlans();
        emit(PlansLoadedState(plans: _plans));
      }
    });

    on<EditPlanEvent>((event, emit) async {
      for (Plan plan in _service.plans) {
        if (plan.id == event.plan.id) {
          plan.name = event.plan.name;
          plan.departure = event.plan.departure;
          plan.arrival = event.plan.arrival;
          plan.ticketPrice = event.plan.ticketPrice;
          plan.hotel = event.plan.hotel;
          plan.notes = event.plan.notes;
        }
      }
      _plans = await _service.updatePlans();
      emit(PlansLoadedState(plans: _plans));
    });

    on<DeletePlanEvent>((event, emit) async {
      _service.plans.removeWhere((element) => element.id == event.id);
      _plans = await _service.updatePlans();
      emit(PlansLoadedState(plans: _plans));
    });
  }
}
