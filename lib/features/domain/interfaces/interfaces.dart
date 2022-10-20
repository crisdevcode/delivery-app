import 'package:delivery/base/api_service/app_error.dart';
import 'package:delivery/features/data/decodables/auth/user_auth_data_decodable.dart';
import 'package:delivery/features/data/decodables/user/user_decodable.dart';
import 'package:delivery/features/data/repositories/auth/sign_in_repository/sign_in_body_parameters.dart';
import 'package:delivery/features/data/repositories/auth/sign_up_repository/sign_up_repository_parameters.dart';
import 'package:delivery/features/data/repositories/auth/user_auth_data/user_auth_data_repository_body_parameters.dart';
import 'package:delivery/features/data/repositories/user/user_body_parameters.dart';
import 'package:delivery/services/firebase_services/auth_firebase_services/decodables/sign_in_decodable.dart';
import 'package:delivery/services/firebase_services/auth_firebase_services/decodables/sign_up_decodable.dart';
import 'package:delivery/services/firebase_services/auth_firebase_services/decodables/update_password_decodable.dart';
import 'package:delivery/utils/Helpers/ResultType/ResultType.dart';

// Auth Repositories
abstract class SignInRepository {
  Future<Result<SignInDecodable, Failure>> signIn(
      {required SignInBodyParameters params});
}

abstract class SignUpRepository {
  // SignUp
  // Data que vamos a enviar a la db
  // return: respuesta <resultado, error>
  Future<Result<SignUpDecodable, Failure>> signUp(
      {required SignUpRepositoryParameters params});
}

abstract class UpdatePasswordRepository {
  Future<Result<UpdatePasswordDecodable, Failure>> updatePassword(
      {required String email});
}

abstract class UserAuthDataRepository {
  Future<Result<UserAuthDataDecodable, Failure>> getUserAuthData(
      {required GetUserDataBodyParameters parameters});
}

// User Database Repositories
abstract class SaveUserDataRepository {
  Future<Result<UserDecodable, Failure>> saveUserData(
      {required UserBodyParameters parameters});
}

abstract class FetchUserDataRepository {
  Future<Result<UserDecodable, Failure>> fetchUserData(
      {required String localId});
}

// Local Storage
abstract class SaveLocalStorageRepository {
  Future<void> saveInLocalStorage({required String key, required String value});
}

abstract class FetchLocalStorageRepository {
  Future<String?> fetchInLocalStorage({required String key});
}

abstract class RemoveLocalStorageRepository {
  Future<void> removeInLocalStorage({required String key});
}
