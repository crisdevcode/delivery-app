import 'package:delivery/features/data/repositories/LocalStorage/save_local_storage_repository.dart';
import 'package:delivery/features/domain/interfaces/interfaces.dart';
import 'package:delivery/features/domain/uses_cases/LocalStorage/local_storage_use_case_parameters.dart';

abstract class SaveLocalStorageUseCase {
  Future<void> execute({required SaveLocalStorageParameters parameters});
}

class DefaultSaveLocalStorageUseCase extends SaveLocalStorageUseCase {
  // Dependencias
  final SaveLocalStorageRepository _saveLocalStorageRepository;

  DefaultSaveLocalStorageUseCase(
      {SaveLocalStorageRepository? saveLocalStorageRepository})
      : _saveLocalStorageRepository =
            saveLocalStorageRepository ?? DefaultSaveLocalStorageRepository();

  @override
  Future<void> execute({required SaveLocalStorageParameters parameters}) async {
    _saveLocalStorageRepository.saveInLocalStorage(
        key: parameters.key, value: parameters.value);
  }
}
