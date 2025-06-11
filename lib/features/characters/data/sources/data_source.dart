import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rick_and_morty_tt/features/characters/data/models/character.dart';

class CharactersDataSource {
  Future<List<Character>> getCharacters({int page = 1}) async {
    try {
      final response = await Dio().get(
        "https://rickandmortyapi.com/api/character/?page=$page",
      );
      final data = response.data["results"] as List<dynamic>;
      return Character.fromJsonList(data);
    } catch (error) {
      log('CHARACTER ERROR: $error');
      rethrow;
    }
  }
}
