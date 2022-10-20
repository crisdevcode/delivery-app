import 'package:delivery/base/api_service/app_error.dart';
import 'package:delivery/base/constants/error_messages.dart';
import 'package:delivery/features/data/repositories/user/save_user_data_repository.dart';
import 'package:delivery/features/data/repositories/user/user_body_parameters.dart';
import 'package:delivery/features/domain/entities/user/user_entity.dart';
import 'package:delivery/features/domain/interfaces/interfaces.dart';
import 'package:delivery/features/domain/uses_cases/user/save_user_data_use_case/save_user_data_use_case_parameters.dart';
import 'package:delivery/utils/Helpers/ResultType/ResultType.dart';

abstract class SaveUserDataUseCase {
  Future<Result<UserEntity, Failure>> execute(
      {required SaveUserDataUseCaseParameters params});
}

class DefaultSaveUserDataUseCase extends SaveUserDataUseCase {
  // Dependencies
  final SaveUserDataRepository _saveUserDataRepository;

  DefaultSaveUserDataUseCase({SaveUserDataRepository? saveUserDataRepository})
      : _saveUserDataRepository =
            saveUserDataRepository ?? DefaultSaveUserDataRepository();

  @override
  Future<Result<UserEntity, Failure>> execute(
      {required SaveUserDataUseCaseParameters params}) {
    UserBodyParameters _parameters = UserBodyParameters(
        localId: params.localId,
        role: params.role?.toShortString(),
        username: params.username,
        email: params.email,
        phone: params.phone,
        dateOfBirth: params.dateOfBirth,
        startDate: params.startDate,
        photo: params.photo,
        shippingAddress: params.shippingAddress,
        billingAddress: params.billingAddress,
        idToken: params.idToken);

    return _saveUserDataRepository
        .saveUserData(parameters: _parameters)
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: AppFailureMessages.unExpectedErrorMessage));
          }
          var entity = UserEntity.fromMap(result.value!.toMap());
          return Result.success(entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
