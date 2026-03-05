import 'package:flutter_test/flutter_test.dart';
import 'package:link_shortener_app/features/home/domain/entities/alias_entity.dart';
import 'package:link_shortener_app/features/home/domain/home_repository.dart';
import 'package:link_shortener_app/features/home/domain/usecases/save_alias_list_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late HomeRepository repository;
  late SaveAliasListUsecase sut;
  late List<AliasEntity> entityList;

  setUp(() {
    repository = MockHomeRepository();
    sut = SaveAliasListUsecase(repository);
    entityList = mockEntityList();
    registerFallbackValue(entityList);
  });

  test('Should send a AliasEntityList when call', () async {
    when(() => repository.saveAliasList(any())).thenAnswer((_) async {});

    await sut(entityList);

    verify(() => repository.saveAliasList(entityList)).called(1);
  });
}
