import 'package:delivery/base/api_service/api_service.dart';
import 'package:delivery/base/api_service/app_error.dart';
import 'package:delivery/services/firebase_services/realtime_database/interfaces/interfaces.dart';

class DefaultRealtimeDatabaseService extends RealtimeDatabaseService {
  final ApiService _apiService;

  // Inyección de dependencias (Instancia)
  DefaultRealtimeDatabaseService({ApiService? apiService})
      : _apiService = apiService ?? DefaultApiService();

  @override
  Future<Map<String, dynamic>> getData({required String path}) async {
    var endpoint = baseUrl + path + endUrl;
    try {
      final result = await _apiService.getDataFromGetRequest(url: endpoint);
      return result;
    } on Failure catch (f) {
      return f.error;
    }
  }

  @override
  Future<Map<String, dynamic>> postData(
      {required Map<String, dynamic> bodyParamaters,
      required String path}) async {
    var endpoint = baseUrl + path + endUrl;
    try {
      final result = await _apiService.getDataFromPostRequest(
          bodyParameters: bodyParamaters, url: endpoint);
      return result;
    } on Failure catch (f) {
      return f.error;
    }
  }

  @override
  Future<Map<String, dynamic>> putData(
      {required Map<String, dynamic> bodyParamaters,
      required String path}) async {
    var endpoint = baseUrl + path + endUrl;
    try {
      final result = await _apiService.getDataFromPutRequest(
          bodyParameters: bodyParamaters, url: endpoint);
      return result;
    } on Failure catch (f) {
      return f.error;
    }
  }
}
