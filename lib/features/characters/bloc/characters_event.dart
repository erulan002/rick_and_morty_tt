part of 'characters_bloc.dart';

abstract class CharactersEvent {
  const CharactersEvent();
}

class LoadEvent extends CharactersEvent {
  const LoadEvent();
}
