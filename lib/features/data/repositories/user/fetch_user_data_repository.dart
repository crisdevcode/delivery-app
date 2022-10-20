import 'package:delivery/base/api_service/app_error.dart';
import 'package:delivery/features/data/decodables/user/user_decodable.dart';
import 'package:delivery/features/domain/interfaces/interfaces.dart';
import 'package:delivery/services/firebase_services/realtime_database/interfaces/interfaces.dart';
import 'package:delivery/services/firebase_services/realtime_database/services/RealtimeDataBaseService.dart';
import 'package:delivery/utils/Helpers/ResultType/ResultType.dart';

extension Paths on DefaultFetchUserDataRepository {
  static String path = "users/";
}

class DefaultFetchUserDataRepository extends FetchUserDataRepository {
  // Dependencias
  final RealtimeDatabaseService _realtimeDatabaseService;

  DefaultFetchUserDataRepository(
      {RealtimeDatabaseService? realtimeDatabaseService})
      : _realtimeDatabaseService =
            realtimeDatabaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<Result<UserDecodable, Failure>> fetchUserData(
      {required String localId}) async {
    var fullpath = path + localId;

    try {
      final result = await _realtimeDatabaseService.getData(path: fullpath);
      UserDecodable _decodable = UserDecodable.fromMap(result);
      return Result.success(_decodable);
    } on Failure catch (f) {
      return Result.failure(f);
    }
  }
}
