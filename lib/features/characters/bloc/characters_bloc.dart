import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_tt/features/characters/data/models/character.dart';
import 'package:rick_and_morty_tt/features/characters/domain/repository/characters_rep.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc({required CharactersRepository repository})
    : _repository = repository,
      super(InitialState()) {
    on<CharactersEvent>(_onLoadCharactersEvent);
  }

  final CharactersRepository _repository;

  Future<void> _onLoadCharactersEvent(
    CharactersEvent event,
    Emitter<CharactersState> emit,
  ) async {
    emit(LoadingState());

    try {
      final characters = await _repository.getCharacters();

      emit(LoadedState(characters: characters));
    } catch (error) {
      emit(ErrorState(error.toString()));
      rethrow;
    }
  }
}
