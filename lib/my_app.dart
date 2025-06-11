import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/characters/bloc/characters_bloc.dart';
import 'features/characters/data/sources/data_source.dart';
import 'features/characters/domain/repository/characters_rep.dart';
import 'home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CharactersBloc(
        repository: CharactersRepository(CharactersDataSource()),
      ),
      child: MaterialApp(
        home: Home(),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.green[100],
          appBarTheme: AppBarTheme(color: Colors.blueGrey),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
