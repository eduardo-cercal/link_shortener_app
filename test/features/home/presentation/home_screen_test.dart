import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:link_shortener_app/features/home/domain/entities/alias_entity.dart';
import 'package:link_shortener_app/features/home/presentation/home_controller.dart';
import 'package:link_shortener_app/features/home/presentation/home_screen.dart';
import 'package:link_shortener_app/features/home/presentation/widgets/loading_list_widget.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shimmer/shimmer.dart';

class MockHomeController extends Mock implements HomeController {}

void main() {
  late HomeController mockController;

  setUp(() {
    mockController = MockHomeController();

    // Configuração de comportamentos padrão dos Observables (Obx)
    when(() => mockController.isListLoading).thenReturn(false.obs);
    when(() => mockController.isCreateAliasLoading).thenReturn(false.obs);
    when(() => mockController.aliasList).thenReturn(<AliasEntity>[].obs);
    when(() => mockController.errorMessage).thenReturn(RxnString());
    when(() => mockController.getAliasList()).thenAnswer((_) async => {});
  });

  group('HomeScreen Widget Tests', () {
    testWidgets(
      'It should display LoadingListWidget (Shimmer) when isListLoading is true',
      (tester) async {
        when(() => mockController.isListLoading).thenReturn(true.obs);

        await tester.pumpWidget(
          MaterialApp(home: HomeScreen(controller: mockController)),
        );

        expect(find.byType(Shimmer), findsWidgets);
        expect(find.byType(LoadingListWidget), findsOneWidget);
      },
    );

    testWidgets('It should display EmptyListWidget when the list is empty.', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: HomeScreen(controller: mockController)),
      );

      expect(find.text('Nenhum link encurtado'), findsOneWidget);
    });

    testWidgets(
      'You should call createAlias ​​when clicking the submit button.',
      (tester) async {
        when(() => mockController.createAlias(any())).thenAnswer((_) async {});

        await tester.pumpWidget(
          MaterialApp(home: HomeScreen(controller: mockController)),
        );

        final input = find.byType(TextField);
        await tester.enterText(input, 'https://google.com');

        final button = find.byType(InkWell);
        await tester.tap(button);

        verify(
          () => mockController.createAlias('https://google.com'),
        ).called(1);
      },
    );
  });

  Widget makeTestableWidget(Widget child) {
    return GetMaterialApp(home: child, debugShowCheckedModeBanner: false);
  }

  group('Golden Tests - HomeScreen', () {
    testWidgets('You must validate the visual layout of the empty state.', (
      tester,
    ) async {
      when(() => mockController.aliasList).thenReturn(<AliasEntity>[].obs);

      await tester.pumpWidget(
        makeTestableWidget(HomeScreen(controller: mockController)),
      );

      // O golden_screenshot tira a captura e compara
      await expectLater(
        find.byType(HomeScreen),
        matchesGoldenFile('goldens/home_screen_empty.png'),
      );
    });

    testWidgets('You must validate the visual layout with Shimmer (Loading).', (
      tester,
    ) async {
      when(() => mockController.isListLoading).thenReturn(true.obs);
      when(() => mockController.aliasList).thenReturn(<AliasEntity>[].obs);

      await tester.pumpWidget(
        makeTestableWidget(HomeScreen(controller: mockController)),
      );

      // Como o Shimmer é uma animação, "congelamos" o frame para o screenshot
      await tester.pump(const Duration(milliseconds: 500));

      await expectLater(
        find.byType(HomeScreen),
        matchesGoldenFile('goldens/home_screen_loading.png'),
      );
    });

    testWidgets('You must validate the layout on a small screen (iPhone SE).', (
      tester,
    ) async {
      when(() => mockController.aliasList).thenReturn(<AliasEntity>[].obs);

      // Define o tamanho da superfície de renderização
      tester.view.physicalSize = const Size(640, 1136);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        makeTestableWidget(HomeScreen(controller: mockController)),
      );

      await expectLater(
        find.byType(HomeScreen),
        matchesGoldenFile('goldens/home_screen_small_device.png'),
      );

      // Resetar após o teste
      addTearDown(tester.view.resetPhysicalSize);
    });
  });
}
