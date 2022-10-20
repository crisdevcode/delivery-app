import 'package:delivery/features/data/repositories/auth/sign_up_repository/sign_up_repository_parameters.dart';
import 'package:delivery/base/api_service/app_error.dart';
import 'package:delivery/features/domain/interfaces/interfaces.dart';
import 'package:delivery/services/firebase_services/auth_firebase_services/interfaces/auth_firebase_interface.dart';
import 'package:delivery/services/firebase_services/auth_firebase_services/services/sign_up_auth_service.dart';
import 'package:delivery/utils/Helpers/ResultType/ResultType.dart';
import 'package:delivery/services/firebase_services/auth_firebase_services/decodables/sign_up_decodable.dart';

// Implementacion de la interfaz SignUpRepository
// Aquí se realizan las consultas a la Database por medio de la inyección
// del AppService.
class DefaultSignUpRepository extends SignUpRepository {
  // Inyección
  final SignUpService _signUpService;

  DefaultSignUpRepository({SignUpService? signUpService})
      : _signUpService = signUpService ?? DefaultSignUpService();

  @override
  Future<Result<SignUpDecodable, Failure>> signUp(
      {required SignUpRepositoryParameters params}) async {
    try {
      final result = await _signUpService.signUp(bodyParams: params.toMap());
      // Parseamos la data de map en una clase facil de gestional
      SignUpDecodable decodable = SignUpDecodable.fromMap(result);
      // Retornamos
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(
          Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
