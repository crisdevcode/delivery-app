import 'package:delivery/services/firebase_services/auth_firebase_services/interfaces/auth_firebase_interface.dart';

class DefaultGetUserDataService extends GetUserAuthDataService {
  @override
  Future<Map<String, dynamic>> getUserAuthData(
      {required Map<String, dynamic> bodyParameters}) {
    return apiService.getDataFromPostRequest(
        bodyParameters: bodyParameters, url: endpoint);
  }
}
