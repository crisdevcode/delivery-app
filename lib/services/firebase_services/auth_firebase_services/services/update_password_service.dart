import 'package:delivery/services/firebase_services/auth_firebase_services/body_params/update_password_body_parameters.dart';
import 'package:delivery/services/firebase_services/auth_firebase_services/interfaces/auth_firebase_interface.dart';

class DefaultUpdatePasswordUserService extends UpdatePasswordUserService {
  final String _requestType = "PASSWORD_RESET";

  @override
  Future<Map<String, dynamic>> updatePassword({required String email}) async {
    final params =
        UpdatePasswordBodyParameters(requestType: _requestType, email: email);
    return apiService.getDataFromPostRequest(
        bodyParameters: params.toMap(), url: endpoint);
  }
}
