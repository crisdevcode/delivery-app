import 'package:delivery/services/firebase_services/auth_firebase_services/auth_firebase_interface.dart';

class DefaulSignUpService extends SignUpService {
  @override
  Future<Map<String, dynamic>> signUp(
      {required Map<String, dynamic> bodyParams}) {
    return apiService.getDataFromPostRequest(
        bodyParameters: bodyParams, url: endpoint);
  }
}
