import 'package:link_shortener_app/features/home/domain/usecases/create_alias_usecase.dart';
import 'package:link_shortener_app/features/home/factories/data/home_repository_factory.dart';

CreateAliasUsecase createAliasUsecaseFactory() =>
    CreateAliasUsecase(homeRepositoryFactory());
