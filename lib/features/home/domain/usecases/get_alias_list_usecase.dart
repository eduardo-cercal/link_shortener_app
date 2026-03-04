import 'package:link_shortener_app/core/domain/usecase.dart';
import 'package:link_shortener_app/features/home/domain/entities/alias_entity.dart';
import 'package:link_shortener_app/features/home/domain/home_repository.dart';

class GetAliasListUsecase implements FutureUsecase<AliasEntity?, void> {
  final HomeRepository repository;

  GetAliasListUsecase(this.repository);

  @override
  Future<AliasEntity?> call([void input]) async =>
      await repository.getAliasList();
}
