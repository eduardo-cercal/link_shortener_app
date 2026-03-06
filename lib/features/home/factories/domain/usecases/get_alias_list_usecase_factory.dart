import 'package:link_shortener_app/features/home/domain/usecases/get_alias_list_usecase.dart';
import 'package:link_shortener_app/features/home/factories/data/home_repository_factory.dart';

GetAliasListUsecase getAliasListUsecaseFactory() =>
    GetAliasListUsecase(homeRepositoryFactory());
