import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:link_shortener_app/core/utils/failure.dart';
import 'package:link_shortener_app/features/home/domain/entities/alias_entity.dart';
import 'package:link_shortener_app/features/home/domain/entities/link_entity.dart';
import 'package:link_shortener_app/features/home/domain/usecases/create_alias_usecase.dart';
import 'package:link_shortener_app/features/home/domain/usecases/get_alias_list_usecase.dart';
import 'package:link_shortener_app/features/home/domain/usecases/save_alias_list_usecase.dart';
import 'package:link_shortener_app/features/home/presentation/getx_home_controller.dart';
import 'package:link_shortener_app/features/home/presentation/home_controller.dart';
import 'package:mocktail/mocktail.dart';

class MockCreateAliasUsecase extends Mock implements CreateAliasUsecase {}

class MockGetAliasListUsecase extends Mock implements GetAliasListUsecase {}

class MockSaveAliasListUsecase extends Mock implements SaveAliasListUsecase {}

void main() {
  late CreateAliasUsecase createAliasUsecase;
  late GetAliasListUsecase getAliasListUsecase;
  late SaveAliasListUsecase saveAliasListUsecase;
  late HomeController sut;
  late String link;
  late AliasEntity entity;
  late List<AliasEntity> entityList;

  AliasEntity mockEntity() => AliasEntity(
    alias: faker.internet.httpsUrl(),
    link: LinkEntity(
      short: faker.internet.httpsUrl(),
      self: faker.internet.httpsUrl(),
    ),
  );

  List<AliasEntity> mockList() => [entity];

  setUp(() {
    createAliasUsecase = MockCreateAliasUsecase();
    getAliasListUsecase = MockGetAliasListUsecase();
    saveAliasListUsecase = MockSaveAliasListUsecase();
    sut = GetxHomeController(
      createAliasUsecase: createAliasUsecase,
      getAliasListUsecase: getAliasListUsecase,
      saveAliasListUsecase: saveAliasListUsecase,
    );
    link = faker.internet.httpsUrl();
    entity = mockEntity();
    entityList = mockList();
    registerFallbackValue(entityList);
  });

  group('create alias', () {
    When mockCreateAlias() => when(() => createAliasUsecase(any()));
    test('should create a alias when recieve a string', () async {
      mockCreateAlias().thenAnswer((_) async => entity);
      when(() => saveAliasListUsecase(any())).thenAnswer((_) async {});

      expectLater(sut.isCreateAliasLoading.stream, emitsInOrder([true, false]));

      await sut.createAlias(link);

      expect(sut.aliasList, entityList);

      verify(() => createAliasUsecase(link)).called(1);
      verify(() => saveAliasListUsecase(entityList)).called(1);
    });

    test('should return a error when a Failure is throwed', () async {
      mockCreateAlias().thenThrow(CreateFailure());

      expectLater(
        sut.errorMessage.stream,
        emits('Erro ao criar link simplificado'),
      );

      await sut.createAlias(link);
    });
  });

  group('get alias list', () {
    test('should create a alias when recieve a string', () async {
      when(() => getAliasListUsecase()).thenAnswer((_) async => entityList);

      expectLater(sut.isListLoading.stream, emitsInOrder([true, false]));

      await sut.getAliasList();

      expect(sut.aliasList, entityList);
    });
  });
}
