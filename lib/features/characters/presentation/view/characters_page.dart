import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/features/characters/presentation/bloc/character_bloc.dart';

// Import your CharacterBloc and CharacterState here

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  @override
  void initState() {
    super.initState();
    CharacterBloc bloc = context.read<CharacterBloc>();
    bloc.add(LoadCharacters());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character List'),
      ),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == Status.error) {
            return Center(
              child: Text(state.error.message),
            );
          } else if (state.status == Status.loaded) {
            return ListView.builder(
              itemCount: state.characterList.length,
              itemBuilder: (context, index) {
                final character = state.characterList[index];
                return ListTile(
                  title: Text(character.name),
                  // Add more character information here as needed
                );
              },
            );
          }
          return Container(); // Return an empty container by default
        },
      ),
    );
  }
}
