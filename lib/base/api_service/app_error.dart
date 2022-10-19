import 'dart:convert';

class Failure {
  // Message
  String? message;
  Map<String, dynamic> error = {};

  @override
  String toString() => message ?? "";

  // Clase con multiples constructores
  Failure.fromMessage({this.message});

  Failure.fromBody({required String body}) {
    var jsonData = jsonDecode(body);
    error = jsonData;
  }
}
