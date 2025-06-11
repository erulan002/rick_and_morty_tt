import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_tt/features/characters/data/models/character.dart';
import 'package:rick_and_morty_tt/features/characters/domain/repository/characters_rep.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharactersRepository _repository;

  final List<Character> _allCharacters = [];
  final List<Character> _favorites = [];
  int _currentPage = 1;
  bool _isLoadingMore = false;
  bool _hasMore = true;

  CharactersBloc({required CharactersRepository repository})
    : _repository = repository,
      super(CharactersLoadingState()) {
    on<LoadCharactersEvent>(_onLoadCharacters);
    on<LoadMoreCharactersEvent>(_onLoadMoreCharacters);
    on<ToggleFavoriteEvent>(_onToggleFavorite);
  }

  Future<void> _onLoadCharacters(
    LoadCharactersEvent event,
    Emitter<CharactersState> emit,
  ) async {
    emit(CharactersLoadingState());
    _currentPage = 1;
    _hasMore = true;
    _allCharacters.clear();

    try {
      final characters = await _repository.getCharacters(page: _currentPage);
      _allCharacters.addAll(characters);
      await _loadFavorites();

      emit(
        CharactersLoadedState(
          characters: List.unmodifiable(_allCharacters),
          favorites: List.unmodifiable(_favorites),
          hasMore: _hasMore,
        ),
      );
    } catch (e) {
      emit(CharactersErrorState(e.toString()));
      rethrow;
    }
  }

  Future<void> _onLoadMoreCharacters(
    LoadMoreCharactersEvent event,
    Emitter<CharactersState> emit,
  ) async {
    if (_isLoadingMore || !_hasMore) return;
    _isLoadingMore = true;
    _currentPage++;

    try {
      final more = await _repository.getCharacters(page: _currentPage);
      if (more.isEmpty) {
        _hasMore = false;
      } else {
        _allCharacters.addAll(more);
      }
      emit(
        CharactersLoadedState(
          characters: List.unmodifiable(_allCharacters),
          favorites: List.unmodifiable(_favorites),
          hasMore: _hasMore,
        ),
      );
    } catch (_) {
      _hasMore = false;
    } finally {
      _isLoadingMore = false;
    }
  }

  void _onToggleFavorite(
    ToggleFavoriteEvent event,
    Emitter<CharactersState> emit,
  ) async {
    final exists = _favorites.any((c) => c.id == event.character.id);
    if (exists) {
      _favorites.removeWhere((c) => c.id == event.character.id);
    } else {
      _favorites.add(event.character);
    }
    await _saveFavorites();
    if (state is CharactersLoadedState) {
      final currentState = state as CharactersLoadedState;
      emit(
        CharactersLoadedState(
          characters: currentState.characters,
          favorites: List.unmodifiable(_favorites),
          hasMore: currentState.hasMore,
        ),
      );
    }
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final ids = _favorites.map((c) => c.id).toList();
    prefs.setString('favorites', jsonEncode(ids));
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString('favorites');
    if (saved != null) {
      final List decoded = jsonDecode(saved);
      _favorites.clear();
      _favorites.addAll(_allCharacters.where((c) => decoded.contains(c.id)));
    }
  }
}
