import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return SizedBox(
      width: 0.45.sw,
      child: ListTile(
        title: Text(title),
        onTap: () {
          final bloc = context.read<CharacterBloc>();
          bloc.add(UpdateFilter(filter: filter));
        },
      ),
    );
  }
}
