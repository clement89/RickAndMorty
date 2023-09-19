import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/features/characters/presentation/bloc/character_bloc.dart';
import 'package:rick_morty/features/characters/presentation/widgets/character_card.dart';
import 'package:rick_morty/features/characters/presentation/widgets/filter_bottom_sheet.dart';
import 'package:rick_morty/router/app_router.gr.dart';
import 'package:rick_morty/widgets/custom_loader.dart';

@RoutePage()
class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final ScrollController _scrollController = ScrollController();
  late CharacterBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = context.read<CharacterBloc>();
    _bloc.add(const LoadCharacters(isReload: false));
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _bloc.add(const LoadCharacters(isReload: false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick & Morty'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              showFilterBottomSheet(context);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        color: Colors.white,
        backgroundColor: Colors.blue,
        strokeWidth: 4.0,
        onRefresh: () async {
          _bloc.add(const LoadCharacters(isReload: true));
          return Future<void>.delayed(const Duration(seconds: 1));
        },
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            if (state.status == Status.loading && state.filteredList.isEmpty) {
              return const Center(
                child: CustomLoader(),
              );
            } else if (state.status == Status.error) {
              return Center(
                child: Text(state.error.message),
              );
            } else if (state.status == Status.loaded) {
              return ListView.builder(
                controller: _scrollController,
                itemCount: state.filteredList.length,
                itemBuilder: (context, index) {
                  final character = state.filteredList[index];
                  return GestureDetector(
                    onTap: () {
                      final router = AutoRouter.of(context);
                      router.push(CharacterDetailsRoute(character: character));
                    },
                    child: CharacterCard(
                      character: character,
                      key: Key(
                        character.id.toString(),
                      ),
                    ),
                  );
                },
              );
            }
            return const Text('No data found');
          },
        ),
      ),
    );
  }
}
