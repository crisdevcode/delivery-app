import 'dart:convert';

import 'package:delivery/base/constants/error_messages.dart';
import 'package:delivery/services/firebase_services/auth_firebase_services/decodables/auth_error_decodable.dart';

class Failure {
  // Message
  String? message;
  Map<String, dynamic> error = {};

  @override
  String toString() => message ?? "Hubo un error inesperado";

  // Clase con multiples constructores
  Failure.fromMessage({this.message});

  Failure.fromBody({required String body}) {
    // String to json parse -> to map {}
    var jsonData = jsonDecode(body);
    error = jsonData;
  }

  // Errores desde firebase
  // Mapeado o parseado al AuthErrorDecondable
  static getFirebaseAuthErrorMessage({required Map<String, dynamic> error}) {
    AuthErrorDecodable _errrorDecodable = AuthErrorDecodable.fromMap(error);

    var message = "";
    _errrorDecodable.error?.errors?.forEach((error) {
      message = error.message ?? "";
    });

    if (message == "EMAIL_NOT_FOUND") {
      return Failure.fromMessage(
          message: FirebaseFailureMessage.emailNotFoundMessage);
    } else if (message == "INVALID_PASSWORD") {
      return Failure.fromMessage(
          message: FirebaseFailureMessage.invalidPasswordMessage);
    } else if (message == "EMAIL_EXISTS") {
      return Failure.fromMessage(
          message: FirebaseFailureMessage.emailExistMessage);
    } else if (message == "TOO_MANY_ATTEMPTS_TRY_LATER") {
      return Failure.fromMessage(
          message: FirebaseFailureMessage.tooManyAttemptsMessage);
    } else if (message == "INVALID_ID_TOKEN") {
      return Failure.fromMessage(
          message: FirebaseFailureMessage.invalidIdTokenMessage);
    } else if (message == "USER_NOT_FOUND") {
      return Failure.fromMessage(
          message: FirebaseFailureMessage.userNotFoundMessage);
    } else {
      return Failure.fromMessage(message: message);
    }
  }
}
