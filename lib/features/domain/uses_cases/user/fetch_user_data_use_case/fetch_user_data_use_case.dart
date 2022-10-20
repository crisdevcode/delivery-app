import 'package:delivery/base/api_service/app_error.dart';
import 'package:delivery/base/constants/error_messages.dart';
import 'package:delivery/features/data/repositories/user/fetch_user_data_repository.dart';
import 'package:delivery/features/domain/entities/user/user_entity.dart';
import 'package:delivery/features/domain/interfaces/interfaces.dart';
import 'package:delivery/utils/Helpers/ResultType/ResultType.dart';

abstract class FetchUserDataUseCase {
  Future<Result<UserEntity, Failure>> execute({required String localId});
}

class DefaultFetchUserDataUseCase extends FetchUserDataUseCase {
  // Dependencias
  final FetchUserDataRepository _fetchUserDataRepository;

  DefaultFetchUserDataUseCase(
      {FetchUserDataRepository? fetchUserDataRepository})
      : _fetchUserDataRepository =
            fetchUserDataRepository ?? DefaultFetchUserDataRepository();

  @override
  Future<Result<UserEntity, Failure>> execute({required String localId}) {
    return _fetchUserDataRepository
        .fetchUserData(localId: localId)
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: AppFailureMessages.unExpectedErrorMessage));
          }
          return Result.success(UserEntity.fromMap(result.value!.toMap()));
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
