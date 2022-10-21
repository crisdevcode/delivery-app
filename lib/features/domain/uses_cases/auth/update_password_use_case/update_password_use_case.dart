import 'package:delivery/features/data/repositories/auth/update_password_repository/update_password_repository.dart';
import 'package:delivery/features/domain/interfaces/interfaces.dart';

abstract class UpdatePasswordUseCase {
  Future<void> execute({required String email});
}

class DefaultUpdatePasswordUseCase extends UpdatePasswordUseCase {
  // Dependencias
  final UpdatePasswordRepository _updatePasswordRepository;

  DefaultUpdatePasswordUseCase(
      {UpdatePasswordRepository? updatePasswordRepository})
      : _updatePasswordRepository =
            updatePasswordRepository ?? DefaultUpdatePasswordRepository();

  @override
  Future<void> execute({required String email}) {
    return _updatePasswordRepository.updatePassword(email: email);
  }
}
