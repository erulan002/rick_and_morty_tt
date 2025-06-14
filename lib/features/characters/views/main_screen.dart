import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_tt/features/characters/bloc/characters_bloc.dart';
import 'package:rick_and_morty_tt/features/characters/views/widgets/character_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    context.read<CharactersBloc>().add(LoadCharactersEvent());

    _scrollController = ScrollController()
      ..addListener(() {
        final max = _scrollController.position.maxScrollExtent;
        final current = _scrollController.position.pixels;

        if (current >= max - 200) {
          context.read<CharactersBloc>().add(LoadMoreCharactersEvent());
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharactersLoadedState) {
            final characters = state.characters;
            return GridView.builder(
              controller: _scrollController,
              itemCount: characters.length + (state.hasMore ? 1 : 0),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                if (index >= characters.length) {
                  return Center(child: CircularProgressIndicator());
                }

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
            return const Offstage();
          }
        },
      ),
    );
  }
}
