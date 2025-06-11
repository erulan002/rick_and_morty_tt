import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_tt/features/characters/bloc/characters_bloc.dart';
import 'package:rick_and_morty_tt/features/characters/views/widgets/character_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharactersLoadedState) {
            final characters = state.favorites;
            if (characters.isEmpty) {
              return const Center(
                child: Text(
                  'No Favotites Yet.',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 17),
                ),
              );
            }
            return GridView.builder(
              itemCount: characters.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final character = characters[index];
                final isFavorite = state.favorites.any(
                  (c) => c.id == character.id,
                );

                return CharacterCard(
                  characters: characters,
                  hasMore: state.hasMore,
                  favorites: state.favorites,
                  index: index,
                  isFavorite: isFavorite,
                );
              },
            );
          } else if (state is CharactersErrorState) {
            return Center(child: Text(state.error));
          } else {
            return Offstage();
          }
        },
      ),
    );
  }
}
