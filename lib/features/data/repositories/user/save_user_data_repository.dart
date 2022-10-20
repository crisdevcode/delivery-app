import 'package:delivery/base/constants/error_messages.dart';
import 'package:delivery/features/data/repositories/user/user_body_parameters.dart';
import 'package:delivery/features/data/decodables/user/user_decodable.dart';
import 'package:delivery/base/api_service/app_error.dart';
import 'package:delivery/features/domain/interfaces/interfaces.dart';
import 'package:delivery/services/firebase_services/realtime_database/interfaces/interfaces.dart';
import 'package:delivery/services/firebase_services/realtime_database/services/RealtimeDataBaseService.dart';
import 'package:delivery/utils/Helpers/ResultType/ResultType.dart';

abstract class _Paths {
  static String userCollection = "users/";
}

class DefaultSaveUserDataRepository extends SaveUserDataRepository {
  // Dependencias
  final RealtimeDatabaseService _realtimeDatabaseService;

  DefaultSaveUserDataRepository(
      {RealtimeDatabaseService? realtimeDatabaseService})
      : _realtimeDatabaseService =
            realtimeDatabaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<Result<UserDecodable, Failure>> saveUserData(
      {required UserBodyParameters parameters}) async {
    if (parameters.localId == null) {
      return Result.failure(Failure.fromMessage(
          message: AppFailureMessages.unExpectedErrorMessage));
    }
    // Creamos el path
    var path = _Paths.userCollection + parameters.localId!;

    try {
      final result = await _realtimeDatabaseService.putData(
          bodyParamaters: parameters.toMap(), path: path);
      UserDecodable decodable = UserDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(f);
    }
  }
}
