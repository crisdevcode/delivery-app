import 'package:delivery/base/api_service/app_error.dart';
import 'package:delivery/base/constants/error_messages.dart';
import 'package:delivery/features/domain/entities/auth/sign_up_entity/sign_up_entity.dart';
import 'package:delivery/features/domain/uses_cases/auth/sign_up_use_case/sign_up_use_case.dart';
import 'package:delivery/features/domain/uses_cases/auth/sign_up_use_case/sign_up_use_case_parameters.dart';
import 'package:delivery/services/firebase_services/auth_firebase_services/decodables/auth_error_decodable.dart';
import 'package:delivery/utils/Helpers/ResultType/ResultType.dart';
import 'package:flutter_test/flutter_test.dart';

// GIVEN - Dado para testear
// WHEN - Cuando haga o suceda algo
// THWN - Lo que yo espero del test unitario.
abstract class _Constants {
  static String correctEmail = "chris7@gmail.com";
  static String correctPass = "123456";
  static String wrongEmail = "chris8@gmail.com";
  static String wrongPass = "123456";
}

void main() {
  // GIVEN
  SignUpUseCase sut = DefaultSignUpUseCase();

  // Test success signUp feature
  group('Test success signUp feature', () {
    // Test correct signUp user in Firebase
    test('Test correct signUp user in Firebase', () async {
      // GIVEN
      final SignUpUseCaseParameters params = SignUpUseCaseParameters(
          email: _Constants.correctEmail,
          password: _Constants.correctPass,
          username: 'Chris',
          date: '23/10/1989',
          phone: '12333');

      // WHEN
      final result = await sut.execute(params: params);

      switch (result.status) {
        case ResultStatus.success:
          // THEN
          expect(result.value, isA<SignUpEntity>());
          break;
        case ResultStatus.error:
          // THEN
          expect(result.error, Failure);
          break;
      }
    });

    // Test correct signUp user and check the value localId is not empty
    test('Test correct signUp user and check the value localId is not empty',
        () async {
      // GIVEN
      final SignUpUseCaseParameters params = SignUpUseCaseParameters(
          email: _Constants.correctEmail,
          password: _Constants.correctPass,
          username: 'chris');
      // WHEN
      final result = await sut.execute(params: params);

      switch (result.status) {
        case ResultStatus.success:
          // THEN
          final entity = SignUpEntity.fromMap(result.value!.toMap());
          expect(entity.localId!.isNotEmpty, true);
          break;
        case ResultStatus.error:
          // THEN
          expect(result.error, FirebaseFailureMessage.emailExistMessage);
          break;
      }
    });

    // TODO: Añadir más test ;)
  });

  // Test failure signUp feature
  group('Test failure signUp feature', () {
    // Test failure signUp feature in Firebase because the email exists
    test('Test failure signUp feature in Firebase because the email exists',
        () async {
      try {
        // WHEN
        final SignUpUseCaseParameters params = SignUpUseCaseParameters(
            email: _Constants.wrongEmail,
            password: _Constants.wrongPass,
            username: 'chris');
        final result = await sut.execute(params: params);
      } on Failure catch (f) {
        // THEN
        AuthErrorDecodable _error = f as AuthErrorDecodable;
        expect(_error.error!.message, FirebaseFailureMessage.emailExistMessage);
      }
    });

    // TODO: Añadir más test ;)
  });
}
