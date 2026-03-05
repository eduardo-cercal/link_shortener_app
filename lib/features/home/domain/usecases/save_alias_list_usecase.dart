import 'package:link_shortener_app/core/domain/usecase.dart';
import 'package:link_shortener_app/features/home/domain/entities/alias_entity.dart';
import 'package:link_shortener_app/features/home/domain/home_repository.dart';

class SaveAliasListUsecase implements FutureUsecase<void, List<AliasEntity>> {
  final HomeRepository repository;

  SaveAliasListUsecase(this.repository);

  @override
  Future<void> call([List<AliasEntity>? list]) async =>
      await repository.saveAliasList(list!);
}
