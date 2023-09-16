import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_morty/features/characters/presentation/bloc/character_bloc.dart';

class FilterValueItem extends StatelessWidget {
  final String title;
  final Filter filter;
  final Function dismissCallback;
  const FilterValueItem({
    Key? key,
    required this.title,
    required this.filter,
    required this.dismissCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.45.sw,
      child: ListTile(
        title: Text(title),
        onTap: () {
          final bloc = context.read<CharacterBloc>();
          bloc.add(ApplyFilter(filter: filter, value: title));
          dismissCallback();
        },
      ),
    );
  }
}
