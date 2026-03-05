import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:link_shortener_app/core/utils/failure.dart';
import 'package:link_shortener_app/features/home/domain/entities/alias_entity.dart';
import 'package:link_shortener_app/features/home/domain/entities/link_entity.dart';
import 'package:link_shortener_app/features/home/domain/entities/url_entity.dart';
import 'package:link_shortener_app/features/home/domain/home_repository.dart';
import 'package:link_shortener_app/features/home/domain/usecases/create_alias_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late HomeRepository repository;
  late CreateAliasUsecase sut;
  late String link;
  late UrlEntity url;
  late AliasEntity entity;

  UrlEntity mockUrl() => UrlEntity(link);

  AliasEntity mockEntity() => AliasEntity(
    alias: faker.internet.httpsUrl(),
    link: LinkEntity(short: faker.internet.httpsUrl(), self: link),
  );

  setUp(() {
    repository = MockHomeRepository();
    sut = CreateAliasUsecase(repository);
    link = faker.internet.httpsUrl();
    entity = mockEntity();
    url = mockUrl();
    registerFallbackValue(url);
  });

  void mockAnswer(answer) =>
      when(() => repository.createAlias(any())).thenAnswer((_) async => answer);

  void mockThrow(Failure fail) =>
      when(() => repository.createAlias(any())).thenThrow(fail);

  test('should return a AliasEntity when send a valid link', () async {
    mockAnswer(entity);

    final result = await sut(link);

    expect(result, entity);

    verify(() => repository.createAlias(url)).called(1);
  });

  test(
    'should throw a ValidLinkFailure when recieve something different of a web link',
    () {
      mockThrow(ValidLinkFailure());

      final fail = sut(faker.randomGenerator.string(10));

      expect(fail, throwsA(isA<ValidLinkFailure>()));
    },
  );

  test('should rethrow any Failure recieve from repository', () {
    mockThrow(GenericFailure());

    final fail = sut(link);

    expect(fail, throwsA(TypeMatcher<Failure>()));
  });
}
