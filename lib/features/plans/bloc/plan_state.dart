part of 'plan_bloc.dart';

abstract class PlanState {}

class PlanInitial extends PlanState {}

class PlanDepartureState extends PlanState {}

class PlanArrivalState extends PlanState {}

class PlanTicketState extends PlanState {}

class PlanHotelState extends PlanState {}

class PlanNoteState extends PlanState {}

class PlanAddedState extends PlanState {}
