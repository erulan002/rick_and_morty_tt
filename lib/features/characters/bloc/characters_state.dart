part of 'characters_bloc.dart';

abstract class CharactersState {
  const CharactersState();
}

class InitialState extends CharactersState {}

class LoadingState extends CharactersState {}

class LoadedState extends CharactersState {
  final List<Character> characters;
  const LoadedState({this.characters = const []});
}

class ErrorState extends CharactersState {
  final String error;

  ErrorState(this.error);
}
