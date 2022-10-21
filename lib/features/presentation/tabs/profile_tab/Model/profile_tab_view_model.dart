import 'package:delivery/features/domain/uses_cases/auth/sign_out_use_case/sign_out_use_case.dart';
import 'package:delivery/features/presentation/StateProviders/loading_state_provider.dart';

abstract class ProfileTabViewModelInput {
  late LoadingStateProvider loadingStatusState;

  Future<void> signOut();
  void initState({required LoadingStateProvider loadingState});
}

abstract class ProfileTabViewModel extends ProfileTabViewModelInput {}

class DefaultProfileTabViewModel extends ProfileTabViewModel {
  // Dependencias
  final SignOutUseCase _signOutUseCase;

  DefaultProfileTabViewModel({SignOutUseCase? signOutUseCase})
      : _signOutUseCase = signOutUseCase ?? DefaultSignOutUseCase();

  @override
  void initState({required LoadingStateProvider loadingState}) {
    loadingStatusState = loadingState;
  }

  @override
  Future<void> signOut() {
    loadingStatusState.setLoadingState(isLoading: true);
    return _signOutUseCase
        .execute()
        .then((_) => loadingStatusState.setLoadingState(isLoading: false));
  }
}
