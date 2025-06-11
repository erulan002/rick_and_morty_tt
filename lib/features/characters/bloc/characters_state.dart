part of 'characters_bloc.dart';

abstract class CharactersState {}

class CharactersLoadingState extends CharactersState {}

class CharactersLoadedState extends CharactersState {
  final List<Character> characters;
  final List<Character> favorites;
  final bool hasMore;

  CharactersLoadedState({
    required this.characters,
    this.favorites = const [],
    this.hasMore = true,
  });
}

class CharactersErrorState extends CharactersState {
  final String error;
  CharactersErrorState(this.error);
}
