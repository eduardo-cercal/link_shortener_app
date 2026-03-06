import 'package:link_shortener_app/features/home/factories/domain/usecases/create_alias_usecase_factory.dart';
import 'package:link_shortener_app/features/home/factories/domain/usecases/get_alias_list_usecase_factory.dart';
import 'package:link_shortener_app/features/home/factories/domain/usecases/save_alias_list_usecase_factory.dart';
import 'package:link_shortener_app/features/home/presentation/getx_home_controller.dart';
import 'package:link_shortener_app/features/home/presentation/home_controller.dart';

HomeController homeControllerFactory() => GetxHomeController(
  createAliasUsecase: createAliasUsecaseFactory(),
  saveAliasListUsecase: saveAliasListUsecaseFactory(),
  getAliasListUsecase: getAliasListUsecaseFactory(),
);
