import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_tt/features/characters/bloc/characters_bloc.dart';
import 'package:rick_and_morty_tt/features/characters/data/sources/data_source.dart';
import 'package:rick_and_morty_tt/features/characters/domain/repository/characters_rep.dart';
import 'package:rick_and_morty_tt/features/characters/views/favourites_screen.dart';
import 'package:rick_and_morty_tt/features/characters/views/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CharactersBloc(
        repository: CharactersRepository(CharactersDataSource()),
      ),
      child: MaterialApp(home: HomeScreen()),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [MainScreen(), FavouritesScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rick and Morty')),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
