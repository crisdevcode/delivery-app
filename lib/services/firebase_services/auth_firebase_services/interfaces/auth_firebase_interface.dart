// Wrapper para conectar con mi api service
import 'package:delivery/base/api_service/api_service.dart';

abstract class BaseFirebaseService {
  // Se encarga de hacer la llamada a los servicios
  ApiService apiService = DefaultApiService();

  static String baseUrl = "https://identitytoolkit.googleapis.com/v1/";
  static String signUpEndpoint = "accounts:signUp?key=";
  static String signInEndpoint = "accounts:signInWithPassword?key=";
  static String adminToken = "AIzaSyDlhvpY9Xd5ZjLbMKG5bCsPgDtsbUnIe-k";
  static String getUserDataEndpoint = "accounts:lookup?key=";
  static String updatePasswordEndpoint = "accounts:sendOobCode?key=";
}

// SERVICIOS
abstract class SignUpService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl +
      BaseFirebaseService.signUpEndpoint +
      BaseFirebaseService.adminToken;

  Future<Map<String, dynamic>> signUp(
      {required Map<String, dynamic> bodyParams});
}

abstract class SignInService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl +
      BaseFirebaseService.signInEndpoint +
      BaseFirebaseService.adminToken;

  Future<Map<String, dynamic>> signIn(
      {required Map<String, dynamic> bodyParameters});
}

abstract class GetUserAuthDataService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl +
      BaseFirebaseService.getUserDataEndpoint +
      BaseFirebaseService.adminToken;
  Future<Map<String, dynamic>> getUserAuthData(
      {required Map<String, dynamic> bodyParameters});
}

abstract class UpdatePasswordUserService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl +
      BaseFirebaseService.updatePasswordEndpoint +
      BaseFirebaseService.adminToken;
  Future<Map<String, dynamic>> updatePassword({required String email});
}