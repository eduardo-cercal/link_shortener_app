import 'package:link_shortener_app/features/home/domain/usecases/save_alias_list_usecase.dart';
import 'package:link_shortener_app/features/home/factories/data/home_repository_factory.dart';

SaveAliasListUsecase saveAliasListUsecaseFactory() =>
    SaveAliasListUsecase(homeRepositoryFactory());
