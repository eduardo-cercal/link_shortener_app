import 'package:faker/faker.dart';
import 'package:link_shortener_app/features/home/domain/entities/alias_entity.dart';
import 'package:link_shortener_app/features/home/domain/entities/link_entity.dart';

AliasEntity mockEntity() => AliasEntity(
  alias: faker.internet.httpsUrl(),
  link: LinkEntity(
    short: faker.internet.httpsUrl(),
    self: faker.internet.httpsUrl(),
  ),
);
