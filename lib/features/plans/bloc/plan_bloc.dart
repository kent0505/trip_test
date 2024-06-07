import 'package:flutter_bloc/flutter_bloc.dart';

part 'plan_event.dart';
part 'plan_state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  PlanBloc() : super(PlanInitial()) {
    // on<PlanNameEvent>((event, emit) {
    //   log('PlanInitial');
    //   emit(PlanInitial());
    // });
  }
}
