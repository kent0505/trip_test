part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetPlansEvent extends HomeEvent {}

class ChangePageEvent extends HomeEvent {
  final int index;
  ChangePageEvent({required this.index});
}
