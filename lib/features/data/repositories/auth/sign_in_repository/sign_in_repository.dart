import 'package:delivery/features/data/repositories/auth/sign_in_repository/sign_in_body_parameters.dart';
import 'package:delivery/base/api_service/app_error.dart';
import 'package:delivery/features/domain/interfaces/interfaces.dart';
import 'package:delivery/services/firebase_services/auth_firebase_services/interfaces/auth_firebase_interface.dart';
import 'package:delivery/services/firebase_services/auth_firebase_services/services/sign_in_auth_service.dart';
import 'package:delivery/utils/Helpers/ResultType/ResultType.dart';
import 'package:delivery/services/firebase_services/auth_firebase_services/decodables/sign_in_decodable.dart';

class DefaultSignInRepository extends SignInRepository {
  // Dependencies
  final SignInService _signInService;

  DefaultSignInRepository({SignInService? signInService})
      : _signInService = signInService ?? DefaultSignInService();

  @override
  Future<Result<SignInDecodable, Failure>> signIn(
      {required SignInBodyParameters params}) async {
    try {
      final result =
          await _signInService.signIn(bodyParameters: params.toMap());
      SignInDecodable decodable = SignInDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(
          Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
