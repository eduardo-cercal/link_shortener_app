import 'package:link_shortener_app/core/domain/usecase.dart';
import 'package:link_shortener_app/core/utils/failure.dart';
import 'package:link_shortener_app/features/home/domain/entities/alias_entity.dart';
import 'package:link_shortener_app/features/home/domain/entities/url_entity.dart';
import 'package:link_shortener_app/features/home/domain/home_repository.dart';
import 'package:get/get_utils/get_utils.dart';

class CreateAliasUsecase implements FutureUsecase<AliasEntity, String> {
  final HomeRepository repository;

  CreateAliasUsecase(this.repository);

  @override
  Future<AliasEntity> call([String? link]) async {
    try {
      if (!link!.isURL) {
        throw ValidLinkFailure();
      }
      return await repository.createAlias(UrlEntity(link));
    } on Failure {
      rethrow;
    }
  }
}
