import 'package:delivery/base/constants/local_storage_keys.dart';
import 'package:delivery/features/domain/uses_cases/LocalStorage/fetch_local_storage_use_case.dart';
import 'package:delivery/features/domain/uses_cases/LocalStorage/local_storage_use_case_parameters.dart';
import 'package:delivery/features/domain/uses_cases/ValidateCurrentUserUseCase/validate_current_user_use_case.dart';

class RoutesPath {
  static String welcomePath = "welcome";
  static String tabsPath = "tabs";
}

class MainCoordinator {
  // Dependencies
  final FetchLocalStorageUseCase _fetchLocalStorageUseCase;
  final ValidateCurrentUserUseCase _validateCurrentUserCase;

  MainCoordinator(
      {FetchLocalStorageUseCase? fetchLocalStorageUseCase,
      ValidateCurrentUserUseCase? validateCurrentUserCase})
      : _fetchLocalStorageUseCase =
            fetchLocalStorageUseCase ?? DefaultFetchLocalStorageUseCase(),
        _validateCurrentUserCase =
            validateCurrentUserCase ?? DefaultValidateCurrentUserUseCase();

  Future<String?> start() {
    return _isUserLogged().then((value) {
      return value == null ? RoutesPath.welcomePath : RoutesPath.tabsPath;
    });
  }

  Future<String?> _isUserLogged() async {
    var idToken = await _fetchLocalStorageUseCase.execute(
        parameters: FetchLocalStorageParameters(key: LocalStorageKeys.idToken));

    // Revisar si el usuario esta guardado
    if (idToken == null) {
      return null;
    }

    // Hay un token guardado, y vamos a comprobar que el usuario existe aún en Firebase
    var isUserValid = await _validateCurrentUserCase.execute(idToken: idToken);

    if (isUserValid) {
      return idToken;
    } else {
      return null;
    }
  }
}
