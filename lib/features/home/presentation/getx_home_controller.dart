import 'package:get/get.dart';
import 'package:link_shortener_app/core/utils/failure.dart';
import 'package:link_shortener_app/features/home/domain/entities/alias_entity.dart';
import 'package:link_shortener_app/features/home/domain/usecases/create_alias_usecase.dart';
import 'package:link_shortener_app/features/home/domain/usecases/get_alias_list_usecase.dart';
import 'package:link_shortener_app/features/home/domain/usecases/save_alias_list_usecase.dart';
import 'package:link_shortener_app/features/home/presentation/home_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class GetxHomeController extends GetxController implements HomeController {
  final CreateAliasUsecase _createAliasUsecase;
  final SaveAliasListUsecase _saveAliasListUsecase;
  final GetAliasListUsecase _getAliasListUsecase;

  GetxHomeController({
    required CreateAliasUsecase createAliasUsecase,
    required SaveAliasListUsecase saveAliasListUsecase,
    required GetAliasListUsecase getAliasListUsecase,
  }) : _createAliasUsecase = createAliasUsecase,
       _saveAliasListUsecase = saveAliasListUsecase,
       _getAliasListUsecase = getAliasListUsecase;

  final _isCreateAliasLoading = false.obs;
  final _isListLoading = false.obs;
  final _errorMessage = RxnString();
  final _aliasList = <AliasEntity>[].obs;

  @override
  RxList<AliasEntity> get aliasList => _aliasList;

  @override
  RxnString get errorMessage => _errorMessage;

  @override
  RxBool get isCreateAliasLoading => _isCreateAliasLoading;

  @override
  RxBool get isListLoading => _isListLoading;

  @override
  Future<void> createAlias(String link) async {
    try {
      _isCreateAliasLoading.value = true;
      final result = await _createAliasUsecase(link);
      _addToList(result);
      await _saveAliasListUsecase(_aliasList);
    } on Failure catch (e) {
      _errorMessage.value = e.message;
    } finally {
      _isCreateAliasLoading.value = false;
      _errorMessage.value = null;
    }
  }

  @override
  Future<void> getAliasList() async {
    _isListLoading.value = true;
    final result = await _getAliasListUsecase();
    if (result != null) {
      _aliasList.addAll(result);
    }
    _isListLoading.value = false;
  }

  @override
  Future<void> navigateToLink(String link) async {
    if (!(await launchUrl(Uri.parse(link), mode: .externalApplication))) {
      errorMessage.value = 'Não foi possivel navegar para o link';
    }

    errorMessage.value = null;
  }

  void _addToList(AliasEntity result) => _aliasList.insert(0, result);
}
