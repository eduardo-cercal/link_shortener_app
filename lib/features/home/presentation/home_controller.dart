import 'package:get/get.dart';
import 'package:link_shortener_app/features/home/domain/entities/alias_entity.dart';

abstract class HomeController extends GetxController {
  RxBool get isListLoading;
  RxBool get isCreateAliasLoading;
  RxnString get errorMessage;
  RxList<AliasEntity> get aliasList;

  Future<void> createAlias(String link);

  Future<void> getAliasList();

  Future<void> navigateToLink(String link);
}
