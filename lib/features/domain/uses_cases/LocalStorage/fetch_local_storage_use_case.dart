import 'package:delivery/features/data/repositories/LocalStorage/fetch_local_storage_repository.dart';
import 'package:delivery/features/domain/interfaces/interfaces.dart';
import 'package:delivery/features/domain/uses_cases/LocalStorage/local_storage_use_case_parameters.dart';

abstract class FetchLocalStorageUseCase {
  Future<String?> execute({required FetchLocalStorageParameters parameters});
}

class DefaultFetchLocalStorageUseCase extends FetchLocalStorageUseCase {
  // Dependencias
  final FetchLocalStorageRepository _fetchLocalStorageRepository;

  DefaultFetchLocalStorageUseCase(
      {FetchLocalStorageRepository? fetchLocalStorageRepository})
      : _fetchLocalStorageRepository =
            fetchLocalStorageRepository ?? DefaultFetchLocalStorageRepository();

  @override
  Future<String?> execute(
      {required FetchLocalStorageParameters parameters}) async {
    return await _fetchLocalStorageRepository.fetchInLocalStorage(
        key: parameters.key);
  }
}
