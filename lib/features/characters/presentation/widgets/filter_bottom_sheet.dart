// Show the filter bottom sheet
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_morty/features/characters/presentation/bloc/character_bloc.dart';
import 'package:rick_morty/features/characters/presentation/widgets/filter_options_item.dart';
import 'package:rick_morty/features/characters/presentation/widgets/filter_value_item.dart';
import 'package:rick_morty/theme/colors.dart';

Future<void> showFilterBottomSheet(BuildContext context) async {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 0.45.sh,
        child: Container(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Text(
                'Apply Filter',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 20.sp),
              SizedBox(
                height: 0.30.sh,
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        children: [
                          FilterOptionItem(title: 'Name', filter: Filter.name),
                          FilterOptionItem(
                              title: 'Status', filter: Filter.status),
                          FilterOptionItem(
                              title: 'Species', filter: Filter.species),
                        ],
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<CharacterBloc, CharacterState>(
                        builder: (context, state) {
                          return Container(
                            color: state.selectedFilter == Filter.none
                                ? Theme.of(context).scaffoldBackgroundColor
                                : Theme.of(context).hintColor,
                            child: ListView.builder(
                              itemCount: state.filterValues.length,
                              itemBuilder: (context, index) {
                                return FilterValueItem(
                                  filter: state.selectedFilter,
                                  title: state.filterValues[index],
                                  dismissCallback: () {
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  final bloc = context.read<CharacterBloc>();
                  bloc.add(const ApplyFilter(filter: Filter.none, value: ''));
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Clear Filter",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.headerColor,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
