part of 'characters_bloc.dart';

abstract class CharactersEvent {}

class LoadCharactersEvent extends CharactersEvent {}

class ToggleFavoriteEvent extends CharactersEvent {
  final Character character;
  ToggleFavoriteEvent(this.character);
}
