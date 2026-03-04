import 'package:flutter_test/flutter_test.dart';
import 'package:link_shortener_app/features/home/domain/entities/alias_entity.dart';
import 'package:link_shortener_app/features/home/domain/home_repository.dart';
import 'package:link_shortener_app/features/home/domain/usecases/get_alias_list_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late HomeRepository repository;
  late GetAliasListUsecase sut;
  late AliasEntity entity;

  setUp(() {
    repository = MockHomeRepository();
    sut = GetAliasListUsecase(repository);
    entity = mockEntity();
  });

  test('should return a ShortLink Entity when have a list saved', () async {
    when(() => repository.getAliasList()).thenAnswer((_) async => entity);

    final result = await sut();

    expect(result, entity);
  });
}
