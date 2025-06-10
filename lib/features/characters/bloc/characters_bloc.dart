import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_tt/features/characters/data/models/character.dart';
import 'package:rick_and_morty_tt/features/characters/domain/repository/characters_rep.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharactersRepository _repository;

  CharactersBloc({required CharactersRepository repository})
    : _repository = repository,
      super(CharactersLoadingState()) {
    on<LoadCharactersEvent>(_onLoadCharacters);
    on<ToggleFavoriteEvent>(_onToggleFavorite);
  }

  Future<void> _onLoadCharacters(
    LoadCharactersEvent event,
    Emitter<CharactersState> emit,
  ) async {
    emit(CharactersLoadingState());

    try {
      final characters = await _repository.getCharacters();
      emit(CharactersLoadedState(characters: characters));
    } catch (e) {
      emit(CharactersErrorState(e.toString()));
    }
  }

  void _onToggleFavorite(
    ToggleFavoriteEvent event,
    Emitter<CharactersState> emit,
  ) {
    if (state is! CharactersLoadedState) return;

    final currentState = state as CharactersLoadedState;
    final favorites = List<Character>.from(currentState.favorites);

    if (favorites.any((c) => c.id == event.character.id)) {
      favorites.removeWhere((c) => c.id == event.character.id);
    } else {
      favorites.add(event.character);
    }

    emit(currentState.copyWith(favorites: favorites));
  }
}
