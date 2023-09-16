import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_morty/features/characters/presentation/bloc/character_bloc.dart';
import 'package:rick_morty/features/characters/presentation/view/characters_page.dart';
import 'package:rick_morty/widgets/custom_loader.dart'; // Import Mocktail
// Import your CharacterState

class MockCharacterBloc extends Mock
    implements CharacterBloc {} // Extend Mock with MockCharacterBloc

void main() {
  group('CharactersPage Widget Test', () {
    late MockCharacterBloc characterBloc;

    setUp(() {
      characterBloc = MockCharacterBloc();
    });

    testWidgets('Renders CharactersPage correctly',
        (WidgetTester tester) async {
      // Mock the CharacterState for the BlocBuilder
      when(() => characterBloc.state).thenReturn(CharacterState.initial());

      // Build our app and trigger a frame
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

      // Expect to find the 'Rick & Morty' title in the app bar
      expect(find.text('Rick & Morty'), findsOneWidget);

      // Expect to find the filter icon button in the app bar
      expect(find.byIcon(Icons.filter_list), findsOneWidget);

      // Expect to find a RefreshIndicator
      expect(find.byType(RefreshIndicator), findsOneWidget);

      // Expect to find a CustomLoader when the state is loading
      expect(find.byType(CustomLoader), findsOneWidget);

      // Use a when statement to mock other state conditions and check their widgets
    });
  });
}
