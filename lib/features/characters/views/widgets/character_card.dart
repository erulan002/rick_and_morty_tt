import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/characters_bloc.dart';
import '../../data/models/character.dart';

class CharacterCard extends StatelessWidget {
  final List<Character> characters;
  final List<Character> favorites;
  final bool hasMore;
  final int index;
  final bool isFavorite;
  const CharacterCard({
    super.key,
    required this.characters,
    required this.hasMore,
    required this.favorites,
    required this.index,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network('${characters[index].image}', fit: BoxFit.cover),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      context.read<CharactersBloc>().add(
                        ToggleFavoriteEvent(characters[index]),
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green[100],
                      ),
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(
                            scale: CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeInOutBack,
                            ),
                            child: child,
                          );
                        },
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          key: ValueKey<bool>(isFavorite),
                          size: 30,
                          color: Colors.blueGrey, // ← прежний цвет
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blueGrey,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: Text(
                  '${characters[index].name}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.greenAccent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
