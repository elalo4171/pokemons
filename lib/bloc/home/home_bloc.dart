import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equipos_pokemon/config/api_rest.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiRest api;
  HomeBloc(this.api) : super(HomeState()) {
    loadPokemons();
  }

  void loadPokemons() async {
    await api.loadPokemons();
    emit(state.copyWith(havePokemons: true));
  }

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
