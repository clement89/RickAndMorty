import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/features/characters/presentation/bloc/character_bloc.dart';
import 'package:rick_morty/features/characters/presentation/widgets/character_card.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  late CharacterBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = context.read<CharacterBloc>();
    _bloc.add(LoadCharacters());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character List'),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        color: Colors.white,
        backgroundColor: Colors.blue,
        strokeWidth: 4.0,
        onRefresh: () async {
          _bloc.add(LoadCharacters());
          return Future<void>.delayed(const Duration(seconds: 1));
        },
        child: BlocBuilder<CharacterBloc, CharacterState>(
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
                  return CharacterCard(
                    character: character,
                    key: Key(
                      character.id.toString(),
                    ),
                  );
                },
              );
            }
            return Container(); // Return an empty container by default
          },
        ),
      ),
    );
  }
}
