import 'package:delivery/services/firebase_services/auth_firebase_services/interfaces/auth_firebase_interface.dart';

class DefaultSignInService extends SignInService {
  @override
  Future<Map<String, dynamic>> signIn(
      {required Map<String, dynamic> bodyParameters}) {
    return apiService.getDataFromPostRequest(
        bodyParameters: bodyParameters, url: endpoint);
  }
}
