import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/features/characters/presentation/bloc/character_bloc.dart';

class FilterOptionItem extends StatelessWidget {
  final String title;
  final Filter filter;
  const FilterOptionItem({
    Key? key,
    required this.title,
    required this.filter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          return Container(
            color: state.selectedFilter == filter
                ? Theme.of(context).hintColor
                : Theme.of(context).scaffoldBackgroundColor,
            child: ListTile(
              title: Text(title),
              onTap: () {
                final bloc = context.read<CharacterBloc>();
                bloc.add(UpdateFilter(filter: filter));
              },
            ),
          );
        },
      ),
    );
  }
}
