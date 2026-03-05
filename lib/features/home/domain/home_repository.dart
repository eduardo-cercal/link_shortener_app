import 'package:link_shortener_app/features/home/domain/entities/alias_entity.dart';
import 'package:link_shortener_app/features/home/domain/entities/url_entity.dart';

abstract class HomeRepository {
  Future<List<AliasEntity>?> getAliasList();

  Future<void> saveAliasList(List<AliasEntity> list);

  Future<AliasEntity> createAlias(UrlEntity url);
}
