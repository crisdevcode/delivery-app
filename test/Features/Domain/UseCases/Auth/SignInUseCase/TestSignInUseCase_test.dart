import 'package:delivery/base/api_service/app_error.dart';
import 'package:delivery/base/constants/error_messages.dart';
import 'package:delivery/features/domain/entities/auth/sign_in_entity/sign_in_entity.dart';
import 'package:delivery/features/domain/uses_cases/auth/sign_in_use_case/sign_in_use_case_body_parameters.dart';
import 'package:delivery/services/firebase_services/auth_firebase_services/decodables/auth_error_decodable.dart';
import 'package:delivery/utils/Helpers/ResultType/ResultType.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:delivery/features/domain/uses_cases/auth/sign_in_use_case/sign_in_use_case.dart';

abstract class _Constants {
  static String correctEmail = "chris8@gmail.com";
  static String correctPass = "123456";
  static String wrongEmail = "cane45s@gmail.com";
  static String wrongPass = "123456d";
}

void main() {
  // GIVEN
  final SignInUseCase sut = DefaultSignInUseCase();

  group('Test success response to SignInUseCase', () {
    test('Test success signIn feature with correct email and password',
        () async {
      // GIVEN
      final SignInUseCaseBodyParameters _params = SignInUseCaseBodyParameters(
          email: _Constants.correctEmail, password: _Constants.correctPass);
      // WHEN
      var result = await sut.execute(params: _params);
      switch (result.status) {
        case ResultStatus.success:
          expect(result.value, isA<SignInEntity>());
          break;
        case ResultStatus.error:
          //THEN
          expect(result.error, Failure);
          break;
      }
    });

    // TODO: Añadir más test ;)
  });

  group('Test failure response to SignInUseCase', () {
    test('Test failure response to SignInUseCase', () async {
      // GIVEN
      final SignInUseCaseBodyParameters _params = SignInUseCaseBodyParameters(
          email: _Constants.wrongEmail, password: _Constants.wrongPass);

      try {
        final _ = await sut.execute(params: _params);
      } on Failure catch (f) {
        AuthErrorDecodable _error = f as AuthErrorDecodable;
        // THEN
        expect(
            _error.error!.message, FirebaseFailureMessage.emailNotFoundMessage);
      }
    });

    test('Test failure response to SignInUseCase with wrong password',
        () async {
      // GIVEN
      final SignInUseCaseBodyParameters _params = SignInUseCaseBodyParameters(
          email: _Constants.correctEmail, password: _Constants.wrongPass);

      try {
        final _ = await sut.execute(params: _params);
      } on Failure catch (f) {
        AuthErrorDecodable _error = f as AuthErrorDecodable;
        // THEN
        expect(_error.error!.message,
            FirebaseFailureMessage.invalidPasswordMessage);
      }
    });

    // TODO: Añadir más test ;)
  });
}
