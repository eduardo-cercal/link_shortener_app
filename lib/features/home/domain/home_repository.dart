import 'package:link_shortener_app/features/home/domain/entities/alias_entity.dart';

abstract class HomeRepository {
  Future<AliasEntity?> getAliasList();
}
