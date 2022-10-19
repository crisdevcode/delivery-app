import 'dart:convert';
import 'dart:io';

import 'package:delivery/base/api_service/app_error.dart';
import 'package:http/http.dart' as http;

abstract class _Exceptions {
  static String socketExceptionMessage = "No internet connection";
  static String httpException = "Couldn't find the path";
  static String formatException = "Bad response format";
}

// Se encarga de hacer la llamada a la api
abstract class ApiService {
  /// POST
  /// Recibe: body {Map}, url endpoint {String}, headers {Map}
  Future<Map<String, dynamic>> getDataFromPostRequest(
      {required Map<String, dynamic> bodyParameters,
      required String url,
      Map<String, String>? headers});

  /// PUT
  /// Recibe: body {Map}, url endpoint {String}, headers {Map}
  Future<Map<String, dynamic>> getDataFromPutRequest(
      {required Map<String, dynamic> bodyParameters,
      required String url,
      Map<String, String>? headers});

  /// GET
  /// Recibe: body {Map}, url endpoint {String}, headers {Map}
  Future<Map<String, dynamic>> getDataFromGetRequest(
      {required String url, Map<String, String>? headers});
}

// Implementaciones de los HTTP methods de la clase abstracta
class DefaultApiService extends ApiService {
  // GET implementation
  @override
  Future<Map<String, dynamic>> getDataFromGetRequest(
      {required String url, Map<String, String>? headers}) async {
    // Parseo el string a url
    final _url = Uri.parse(url);

    // Obtenemos la respuesta
    final response = await http.get(_url, headers: headers);

    // Manjeamos errores
    try {
      // SUCCESS
      if (response.statusCode.toString().contains('20')) {
        // Parseo la data a Json y la retorno
        var jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        // LANZO Error
        throw Failure.fromBody(body: response.body);
      }
      // Capturo el error dependiendo el error
    } on SocketException {
      throw Failure.fromMessage(message: _Exceptions.socketExceptionMessage);
    } on HttpException {
      throw Failure.fromMessage(message: _Exceptions.httpException);
    } on FormatException {
      throw Failure.fromMessage(message: _Exceptions.formatException);
    }
  }

  // POST implementation
  @override
  Future<Map<String, dynamic>> getDataFromPostRequest(
      {required Map<String, dynamic> bodyParameters,
      required String url,
      Map<String, String>? headers}) async {
    // POST Endpoint
    final _url = Uri.parse(url);
    // Seguridad: body encode
    final body = json.encode(bodyParameters);
    final response = await http.post(_url, headers: headers, body: body);

    // Manjeamos errores
    try {
      // SUCCESS
      if (response.statusCode.toString().contains('20')) {
        // Parseo la data a Json y la retorno
        var jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        // LANZO Error
        throw Failure.fromBody(body: response.body);
      }
      // Capturo el error dependiendo el error
    } on SocketException {
      throw Failure.fromMessage(message: _Exceptions.socketExceptionMessage);
    } on HttpException {
      throw Failure.fromMessage(message: _Exceptions.httpException);
    } on FormatException {
      throw Failure.fromMessage(message: _Exceptions.formatException);
    }
  }

  // PUT implementation
  @override
  Future<Map<String, dynamic>> getDataFromPutRequest(
      {required Map<String, dynamic> bodyParameters,
      required String url,
      Map<String, String>? headers}) async {
    // PUT Endpoint
    final _url = Uri.parse(url);
    // Seguridad: body encode
    final body = json.encode(bodyParameters);
    final response = await http.put(_url, headers: headers, body: body);

    // Manjeamos errores
    try {
      // SUCCESS
      if (response.statusCode.toString().contains('20')) {
        // Parseo la data a Json y la retorno
        var jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        // LANZO Error
        throw Failure.fromBody(body: response.body);
      }
      // Capturo el error dependiendo el error
    } on SocketException {
      throw Failure.fromMessage(message: _Exceptions.socketExceptionMessage);
    } on HttpException {
      throw Failure.fromMessage(message: _Exceptions.httpException);
    } on FormatException {
      throw Failure.fromMessage(message: _Exceptions.formatException);
    }
  }
}
