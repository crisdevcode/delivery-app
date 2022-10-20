import 'package:delivery/base/api_service/app_error.dart';
import 'package:delivery/features/domain/interfaces/interfaces.dart';
import 'package:delivery/services/firebase_services/auth_firebase_services/decodables/update_password_decodable.dart';
import 'package:delivery/services/firebase_services/auth_firebase_services/interfaces/auth_firebase_interface.dart';
import 'package:delivery/services/firebase_services/auth_firebase_services/services/update_password_service.dart';
import 'package:delivery/utils/Helpers/ResultType/ResultType.dart';

class DefaultUpdatePasswordRepository extends UpdatePasswordRepository {
  // * Dependencies
  final UpdatePasswordUserService _updatePasswordUserService;

  DefaultUpdatePasswordRepository(
      {UpdatePasswordUserService? updatePasswordUserService})
      : _updatePasswordUserService =
            updatePasswordUserService ?? DefaultUpdatePasswordUserService();

  @override
  Future<Result<UpdatePasswordDecodable, Failure>> updatePassword(
      {required String email}) async {
    try {
      final result =
          await _updatePasswordUserService.updatePassword(email: email);
      UpdatePasswordDecodable decodable =
          UpdatePasswordDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(
          Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
