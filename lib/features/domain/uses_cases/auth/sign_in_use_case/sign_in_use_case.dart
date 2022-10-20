import 'package:delivery/base/api_service/app_error.dart';
import 'package:delivery/base/constants/error_messages.dart';
import 'package:delivery/features/data/repositories/auth/sign_in_repository/sign_in_body_parameters.dart';
import 'package:delivery/features/data/repositories/auth/sign_in_repository/sign_in_repository.dart';
import 'package:delivery/features/domain/entities/auth/sign_in_entity/sign_in_entity.dart';
import 'package:delivery/features/domain/interfaces/interfaces.dart';
import 'package:delivery/features/domain/uses_cases/auth/sign_in_use_case/sign_in_use_case_body_parameters.dart';
import 'package:delivery/utils/Helpers/ResultType/ResultType.dart';

abstract class SignInUseCase {
  Future<Result<SignInEntity, Failure>> execute(
      {required SignInUseCaseBodyParameters params});
}

class DefaultSignInUseCase extends SignInUseCase {
  // * Dependencies
  final SignInRepository _signInRepository;

  DefaultSignInUseCase({SignInRepository? signInRepository})
      : _signInRepository = signInRepository ?? DefaultSignInRepository();

  @override
  Future<Result<SignInEntity, Failure>> execute(
      {required SignInUseCaseBodyParameters params}) {
    return _signInRepository
        .signIn(
            params: SignInBodyParameters(
                email: params.email, password: params.password))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          // Null Check
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: AppFailureMessages.unExpectedErrorMessage));
          }

          var entity = SignInEntity.fromMap(result.value!.toMap());
          return Result.success(entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
