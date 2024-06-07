import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../plans/models/plan.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<Plan> plans = [
    Plan(
      id: 1,
      name: 'Travel to Italy',
      departure: Flight(
        country: 'France',
        city: 'Paris',
        time: '22:00',
        airport: 'Paris Airport',
      ),
      arrival: Flight(
        country: 'Italy',
        city: 'Rome',
        time: '12:00',
        airport: 'Rome Airport',
      ),
      ticketPrice: 1500,
      hotel: Hotel(
        name: 'Hotel Name',
        price: 300,
      ),
      notes: [
        Note(
          id: 1,
          description: 'Note desc one',
          price: 46,
        ),
        Note(
          id: 2,
          description: 'Note desc two',
          price: 55.40,
        ),
      ],
    ),
    Plan(
      id: 2,
      name: 'Travel to USA',
      departure: Flight(
        country: 'France',
        city: 'Paris',
        time: '22:00',
        airport: 'Paris Airport',
      ),
      arrival: Flight(
        country: 'USA',
        city: 'New-York',
        time: '12:00',
        airport: 'New-York Airport',
      ),
      ticketPrice: 1500,
      hotel: Hotel(name: '', price: 0),
      notes: [],
    ),
    Plan(
      id: 3,
      name: 'Travel to Italy',
      departure: Flight(
        country: 'France',
        city: 'Paris',
        time: '22:00',
        airport: 'Paris Airport',
      ),
      arrival: Flight(
        country: 'Italy',
        city: 'Rome',
        time: '12:00',
        airport: 'Rome Airport',
      ),
      ticketPrice: 1500,
      hotel: Hotel(
        name: 'Hotel Name',
        price: 300,
      ),
      notes: [
        Note(
          id: 1,
          description: 'Note desc one',
          price: 46,
        ),
        Note(
          id: 2,
          description: 'Note desc two',
          price: 55.40,
        ),
      ],
    ),
  ];

  HomeBloc() : super(HomeInitial()) {
    on<GetPlansEvent>((event, emit) {
      emit(HomePlans(plans: plans));
    });

    on<ChangePageEvent>((event, emit) {
      if (event.index == 0) {
        if (state is HomePlans) return;
        log('HomeInitial');
        emit(HomePlans(plans: plans));
      } else {
        if (state is HomeSettings) return;
        log('HomeSettings');
        emit(HomeSettings());
      }
    });
  }
}
