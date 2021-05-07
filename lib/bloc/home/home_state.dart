part of 'home_bloc.dart';

class HomeState {
  final bool havePokemons;

  HomeState({
    this.havePokemons = false,
  });

  HomeState copyWith({
    bool havePokemons,
  }) =>
      HomeState(
        havePokemons: havePokemons ?? this.havePokemons,
      );
}
