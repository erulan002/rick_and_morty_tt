import 'package:rick_and_morty_tt/features/characters/data/models/character.dart';
import 'package:rick_and_morty_tt/features/characters/data/sources/data_source.dart';

class CharactersRepository {
  final CharactersDataSource dataSource;

  CharactersRepository(this.dataSource);

  Future<List<Character>> getCharacters({int page = 1}) async {
    return await dataSource.getCharacters(page: page);
  }
}
