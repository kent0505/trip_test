part of 'plan_bloc.dart';

abstract class PlanEvent {}

class PlanNameEvent extends PlanEvent {}

class PlanDepartureEvent extends PlanEvent {}

class PlanArrivalEvent extends PlanEvent {}

class PlanTicketEvent extends PlanEvent {}

class PlanHotelEvent extends PlanEvent {}

class PlanNoteEvent extends PlanEvent {}

class PlanAddEvent extends PlanEvent {}

class PlanNextEvent extends PlanEvent {}

class PlanPreviousEvent extends PlanEvent {}
