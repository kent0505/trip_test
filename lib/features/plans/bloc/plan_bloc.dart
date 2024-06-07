import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/plan.dart';
import '../service/plan_service.dart';

part 'plan_event.dart';
part 'plan_state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  final _service = PlanService();
  List<Plan> _plans = [];

  PlanBloc() : super(PlanInitial()) {
    // GET plans
    on<GetPlansEvent>((event, emit) async {
      if (_service.plans.isEmpty) {
        _plans = await _service.getPlans();
        emit(PlansLoadedState(plans: _plans));
      } else {
        emit(PlansLoadedState(plans: _plans));
      }
    });

    // ADD NOTE
    on<AddPlanEvent>((event, emit) async {
      if (event.plan.name.isNotEmpty) {
        _service.plans.add(event.plan);
        _plans = await _service.updatePlans();
        emit(PlansLoadedState(plans: _plans));
      }
    });

    // EDIT NOTE
    on<EditPlanEvent>((event, emit) async {
      for (Plan plan in _service.plans) {
        if (plan.id == event.plan.id) {
          // plan.title = event.plan.title;
          // plan.description = event.plan.description;
          // plan.pinned = event.plan.pinned;
        }
      }
      _plans = await _service.updatePlans();
      emit(PlansLoadedState(plans: _plans));
    });

    // DELETE NOTE
    on<DeletePlanEvent>((event, emit) async {
      _service.plans.removeWhere((element) => element.id == event.id);
      _plans = await _service.updatePlans();
      emit(PlansLoadedState(plans: _plans));
    });
  }
}
