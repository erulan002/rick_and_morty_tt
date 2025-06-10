part of 'characters_bloc.dart';

abstract class CharactersState {}

class CharactersLoadingState extends CharactersState {}

class CharactersLoadedState extends CharactersState {
  final List<Character> characters;
  final List<Character> favorites;

  CharactersLoadedState({required this.characters, this.favorites = const []});

  CharactersLoadedState copyWith({
    List<Character>? characters,
    List<Character>? favorites,
  }) {
    return CharactersLoadedState(
      characters: characters ?? this.characters,
      favorites: favorites ?? this.favorites,
    );
  }
}

class CharactersErrorState extends CharactersState {
  final String error;
  CharactersErrorState(this.error);
}
