// // features/characters/bloc/favorite_cubit.dart
//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rick_and_morty_tt/features/characters/data/models/character.dart';
//
// part 'favorite_state.dart';
//
// class FavoriteCubit extends Bloc<,FavoriteState> {
//   FavoriteCubit() : super(FavoriteState(favorites: []));
//
//   void toggleFavorite(Character character) {
//     final favorites = List<Character>.from(state.favorites);
//
//     if (favorites.any((c) => c.id == character.id)) {
//       favorites.removeWhere((c) => c.id == character.id);
//     } else {
//       favorites.add(character);
//     }
//
//     emit(FavoriteState(favorites: favorites));
//   }
// }
