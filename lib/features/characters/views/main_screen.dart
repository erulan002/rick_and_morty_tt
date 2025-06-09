import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_tt/features/characters/bloc/characters_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: BlocBuilder<CharactersBloc, CharactersEvent>(
          builder: (context, state) {
            if (state is InitialState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is LoadedState) {
              return GridView.builder(
                itemCount: 40,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (_, index) {
                  return SizedBox(
                    width: 100,
                    height: 150,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blue,
                          ),
                        ),
                        Positioned(
                          right: 10,
                          bottom: 5,
                          child: IconButton(
                            iconSize: 35,
                            onPressed: () {},
                            icon: Icon(Icons.favorite),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (state is ErrorState) {
              return Center(child: Text(state.toString()));
            } else {
              return Offstage();
            }
          },
        ),
      ),
    );
  }
}
