// Show the filter bottom sheet
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_morty/features/characters/presentation/bloc/character_bloc.dart';
import 'package:rick_morty/features/characters/presentation/widgets/filter_options_item.dart';
import 'package:rick_morty/features/characters/presentation/widgets/filter_value_item.dart';

Future<void> showFilterBottomSheet(BuildContext context) async {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 0.40.sh,
        child: Container(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Text(
                'Apply Filter',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 10.sp),
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
                    SizedBox(
                      width: 0.45.sw,
                      child: BlocBuilder<CharacterBloc, CharacterState>(
                        builder: (context, state) {
                          return ListView.builder(
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
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
