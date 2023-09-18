import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_morty/features/characters/presentation/bloc/character_bloc.dart';
import 'package:rick_morty/features/characters/presentation/view/characters_page.dart';

class MockCharacterBloc extends MockBloc<CharacterEvent, CharacterState>
    implements CharacterBloc {}

class CharacterStateFake extends Fake implements CharacterState {}

class CharacterEventFake extends Fake implements CharacterEvent {}

void main() {
  group('CharactersPage Widget Test', () {
    setUpAll(() {
      registerFallbackValue(CharacterStateFake());
      registerFallbackValue(CharacterEventFake());
    });

    testWidgets('Renders CharactersPage correctly',
        (WidgetTester tester) async {
      final characterBloc = MockCharacterBloc();

      when(() => characterBloc.state).thenReturn(CharacterState.initial());

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<CharacterBloc>(
              create: (context) => characterBloc,
              child: const CharactersPage(),
            ),
          ),
        ),
      );

      // Use tester.pumpAndSettle() to wait for any asynchronous operations to complete
      await tester.pumpAndSettle();

      // Expect to find the 'Rick & Morty' title in the app bar
      expect(find.text('Rick & Morty'), findsOneWidget);

      // Expect to find the filter icon button in the app bar
      expect(find.byIcon(Icons.filter_list), findsOneWidget);

      // Expect to find a RefreshIndicator
      // expect(find.byType(RefreshIndicator), findsOneWidget);

      // Expect to find a CustomLoader when the state is loading
      // expect(find.byType(CustomLoader), findsOneWidget);

      // Use a when statement to mock other state conditions and check their widgets
    });
  });
}
