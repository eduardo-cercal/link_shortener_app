import 'package:faker/faker.dart';
import 'package:link_shortener_app/features/home/domain/entities/alias_entity.dart';
import 'package:link_shortener_app/features/home/domain/entities/link_entity.dart';
import 'package:link_shortener_app/features/home/domain/home_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

List<AliasEntity> mockEntityList() => [
  AliasEntity(
    alias: faker.internet.httpsUrl(),
    link: LinkEntity(
      short: faker.internet.httpsUrl(),
      self: faker.internet.httpsUrl(),
    ),
  ),
  AliasEntity(
    alias: faker.internet.httpsUrl(),
    link: LinkEntity(
      short: faker.internet.httpsUrl(),
      self: faker.internet.httpsUrl(),
    ),
  ),
  AliasEntity(
    alias: faker.internet.httpsUrl(),
    link: LinkEntity(
      short: faker.internet.httpsUrl(),
      self: faker.internet.httpsUrl(),
    ),
  ),
];

List<Map<String, dynamic>> mockJsonList() => [
  {
    'alias': faker.internet.httpsUrl(),
    '_links': {
      'short': faker.internet.httpsUrl(),
      'self': faker.internet.httpsUrl(),
    },
  },
  {
    'alias': faker.internet.httpsUrl(),
    '_links': {
      'short': faker.internet.httpsUrl(),
      'self': faker.internet.httpsUrl(),
    },
  },
  {
    'alias': faker.internet.httpsUrl(),
    '_links': {
      'short': faker.internet.httpsUrl(),
      'self': faker.internet.httpsUrl(),
    },
  },
];

Map<String, dynamic> mockJson() => {
  'alias': faker.internet.httpsUrl(),
  '_links': {
    'short': faker.internet.httpsUrl(),
    'self': faker.internet.httpsUrl(),
  },
};

Map<String, dynamic> mockBody() => {'url': faker..internet.httpsUrl()};
