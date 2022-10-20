import 'package:delivery/base/api_service/app_error.dart';
import 'package:delivery/features/data/decodables/auth/user_auth_data_decodable.dart';
import 'package:delivery/features/data/repositories/auth/user_auth_data/user_auth_data_repository_body_parameters.dart';
import 'package:delivery/features/domain/interfaces/interfaces.dart';
import 'package:delivery/services/firebase_services/auth_firebase_services/interfaces/auth_firebase_interface.dart';
import 'package:delivery/services/firebase_services/auth_firebase_services/services/get_user_auth_data_service.dart';
import 'package:delivery/utils/Helpers/ResultType/ResultType.dart';

class DefaultUserAuthDataRepository extends UserAuthDataRepository {
  // Dependencias
  final GetUserAuthDataService _getUserAuthDataService;

  DefaultUserAuthDataRepository(
      {GetUserAuthDataService? getUserAuthDataService})
      : _getUserAuthDataService =
            getUserAuthDataService ?? DefaultGetUserDataService();

  @override
  Future<Result<UserAuthDataDecodable, Failure>> getUserAuthData(
      {required GetUserDataBodyParameters parameters}) async {
    try {
      final result = await _getUserAuthDataService.getUserAuthData(
          bodyParameters: parameters.toMap());
      UserAuthDataDecodable _decodable = UserAuthDataDecodable.fromMap(result);
      return Result.success(_decodable);
    } on Failure catch (f) {
      return Result.failure(
          Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
