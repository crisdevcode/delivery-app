import 'dart:convert';

// Parse json data to map (OBJECT)
class SignUpDecodable {
  SignUpDecodable({
    this.kind,
    this.idToken,
    this.email,
    this.refreshToken,
    this.expiresIn,
    this.localId,
  });

  String? kind;
  String? idToken;
  String? email;
  String? refreshToken;
  String? expiresIn;
  String? localId;

  factory SignUpDecodable.fromJson(String str) =>
      SignUpDecodable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SignUpDecodable.fromMap(Map<String, dynamic> json) => SignUpDecodable(
        kind: json["kind"] == null ? null : json["kind"],
        idToken: json["idToken"] == null ? null : json["idToken"],
        email: json["email"] == null ? null : json["email"],
        refreshToken:
            json["refreshToken"] == null ? null : json["refreshToken"],
        expiresIn: json["expiresIn"] == null ? null : json["expiresIn"],
        localId: json["localId"] == null ? null : json["localId"],
      );

  Map<String, dynamic> toMap() => {
        "kind": kind == null ? null : kind,
        "idToken": idToken == null ? null : idToken,
        "email": email == null ? null : email,
        "refreshToken": refreshToken == null ? null : refreshToken,
        "expiresIn": expiresIn == null ? null : expiresIn,
        "localId": localId == null ? null : localId,
      };
}