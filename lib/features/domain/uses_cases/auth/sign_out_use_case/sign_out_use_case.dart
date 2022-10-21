import 'package:delivery/base/constants/local_storage_keys.dart';
import 'package:delivery/features/domain/uses_cases/LocalStorage/local_storage_use_case_parameters.dart';
import 'package:delivery/features/domain/uses_cases/LocalStorage/remove_local_storage_use_case.dart';

abstract class SignOutUseCase {
  Future<void> execute();
}

class DefaultSignOutUseCase extends SignOutUseCase {
  // Dependencias
  final RemoveLocalStorageUseCase _removeLocalStorageUseCase;

  DefaultSignOutUseCase({RemoveLocalStorageUseCase? removeLocalStorageUseCase})
      : _removeLocalStorageUseCase =
            removeLocalStorageUseCase ?? DefaultRemoveLocalStorageUseCase();

  @override
  Future<void> execute() async {
    return _removeLocalStorageUseCase.execute(
        parameters:
            RemoveLocalStorageParameters(key: LocalStorageKeys.idToken));
  }
}
