part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomePlans extends HomeState {
  final List<Plan> plans;
  HomePlans({required this.plans});
}

class HomeSettings extends HomeState {}
