import 'package:delivery/base/api_service/app_error.dart';
import 'package:delivery/base/constants/error_messages.dart';
import 'package:delivery/features/data/repositories/auth/user_auth_data/user_auth_data_repository.dart';
import 'package:delivery/features/data/repositories/auth/user_auth_data/user_auth_data_repository_body_parameters.dart';
import 'package:delivery/features/domain/entities/auth/user_auth_data/user_auth_data_entity.dart';
import 'package:delivery/features/domain/interfaces/interfaces.dart';
import 'package:delivery/features/domain/uses_cases/auth/user_auth_data/user_data_use_case_parameters.dart';
import 'package:delivery/utils/Helpers/ResultType/ResultType.dart';

abstract class UserAuthDataUseCase {
  Future<Result<UserAuthDataEntity, Failure>> execute(
      {required GetUserDataUseCaseParameters parameters});
}

class DefaultUserAuthDataUseCase extends UserAuthDataUseCase {
  // Dependencias
  final UserAuthDataRepository _userAuthDataRepository;

  DefaultUserAuthDataUseCase({UserAuthDataRepository? userAuthDataRepository})
      : _userAuthDataRepository =
            userAuthDataRepository ?? DefaultUserAuthDataRepository();

  @override
  Future<Result<UserAuthDataEntity, Failure>> execute(
      {required GetUserDataUseCaseParameters parameters}) {
    return _userAuthDataRepository
        .getUserAuthData(
            parameters: GetUserDataBodyParameters(idToken: parameters.idToken))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: AppFailureMessages.unExpectedErrorMessage));
          }
          return Result.success(
              UserAuthDataEntity.fromMap(result.value!.toMap()));
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
