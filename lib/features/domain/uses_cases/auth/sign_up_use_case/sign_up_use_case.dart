import 'package:delivery/base/api_service/app_error.dart';
import 'package:delivery/base/constants/error_messages.dart';
import 'package:delivery/features/data/repositories/auth/sign_up_repository/sign_up_repository.dart';
import 'package:delivery/features/data/repositories/auth/sign_up_repository/sign_up_repository_parameters.dart';
import 'package:delivery/features/domain/entities/auth/sign_up_entity/sign_up_entity.dart';
import 'package:delivery/features/domain/entities/user/user_entity.dart';
import 'package:delivery/features/domain/interfaces/interfaces.dart';
import 'package:delivery/features/domain/uses_cases/auth/sign_up_use_case/sign_up_use_case_parameters.dart';
import 'package:delivery/features/domain/uses_cases/user/save_user_data_use_case/save_user_data_use_case.dart';
import 'package:delivery/features/domain/uses_cases/user/save_user_data_use_case/save_user_data_use_case_parameters.dart';
import 'package:delivery/utils/Helpers/Date/date_helpers.dart';
import 'package:delivery/utils/Helpers/ResultType/ResultType.dart';
import 'package:delivery/utils/Helpers/UserPhoto/default_user_photo_helper.dart';

// Abstracción ya que presentación depende de domain
// Recibe más parametros que la capa de data
abstract class SignUpUseCase {
  // Execute es un estandar
  Future<Result<SignUpEntity, Failure>> execute(
      {required SignUpUseCaseParameters params});
}

class DefaultSignUpUseCase extends SignUpUseCase {
  final SignUpRepository _signUpRepository;
  final SaveUserDataUseCase _saveUserDataUseCase;

  DefaultSignUpUseCase(
      {SignUpRepository? signUpRepository,
      SaveUserDataUseCase? saveUserDataUseCase})
      : _signUpRepository = signUpRepository ?? DefaultSignUpRepository(),
        _saveUserDataUseCase =
            saveUserDataUseCase ?? DefaultSaveUserDataUseCase();

  @override
  Future<Result<SignUpEntity, Failure>> execute(
      {required SignUpUseCaseParameters params}) {
    return _signUpRepository
        .signUp(
            params: SignUpRepositoryParameters(
                email: params.email, password: params.password))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          // Null Check
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: AppFailureMessages.unExpectedErrorMessage));
          }
          return saveUserDataInDataBase(
              params: params,
              entity: SignUpEntity.fromMap(result.value!.toMap()));
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}

extension on DefaultSignUpUseCase {
  Future<Result<SignUpEntity, Failure>> saveUserDataInDataBase(
      {required SignUpUseCaseParameters params, required SignUpEntity entity}) {
    SaveUserDataUseCaseParameters _params = SaveUserDataUseCaseParameters(
        localId: entity.localId,
        role: UserRole.user,
        username: params.username,
        email: entity.email,
        phone: params.phone,
        dateOfBirth: params.date,
        startDate: DateHelpers.getStartDate(),
        photo: DefaultUserPhotoHelper.defaultUserPhoto,
        shippingAddress: '',
        billingAddress: '',
        idToken: entity.idToken);

    return _saveUserDataUseCase.execute(params: _params).then((result) {
      switch (result.status) {
        case ResultStatus.success:
          return Result.success(entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
