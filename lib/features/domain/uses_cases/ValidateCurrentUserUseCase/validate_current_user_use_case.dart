import 'package:delivery/base/api_service/app_error.dart';
import 'package:delivery/features/domain/uses_cases/auth/user_auth_data/user_data_use_case.dart';
import 'package:delivery/features/domain/uses_cases/auth/user_auth_data/user_data_use_case_parameters.dart';
import 'package:delivery/utils/Helpers/ResultType/ResultType.dart';

abstract class ValidateCurrentUserUseCase {
  Future<bool> execute({required String idToken});
}

class DefaultValidateCurrentUserUseCase extends ValidateCurrentUserUseCase {
  final UserAuthDataUseCase _authDataUseCase;

  DefaultValidateCurrentUserUseCase({UserAuthDataUseCase? authDataUseCase})
      : _authDataUseCase = authDataUseCase ?? DefaultUserAuthDataUseCase();

  @override
  Future<bool> execute({required String idToken}) async {
    try {
      return _authDataUseCase
          .execute(parameters: GetUserDataUseCaseParameters(idToken: idToken))
          .then((result) {
        switch (result.status) {
          case ResultStatus.success:
            return true;
          case ResultStatus.error:
            return false;
        }
      });
    } on Failure {
      return false;
    }
  }
}
