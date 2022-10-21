import 'package:delivery/base/Views/base_view.dart';
import 'package:delivery/base/api_service/app_error.dart';
import 'package:delivery/base/constants/local_storage_keys.dart';
import 'package:delivery/features/domain/uses_cases/LocalStorage/local_storage_use_case_parameters.dart';
import 'package:delivery/features/domain/uses_cases/LocalStorage/save_local_storage_use_case.dart';
import 'package:delivery/features/domain/uses_cases/auth/sign_in_use_case/sign_in_use_case.dart';
import 'package:delivery/features/domain/uses_cases/auth/sign_in_use_case/sign_in_use_case_body_parameters.dart';
import 'package:delivery/features/presentation/StateProviders/loading_state_provider.dart';
import 'package:delivery/features/presentation/common_widgets/TexFormFields/custom_text_form_field.dart';
import 'package:delivery/features/presentation/login_page/Model/login_model.dart';
import 'package:delivery/utils/Helpers/ResultType/ResultType.dart';
import 'package:flutter/widgets.dart';

abstract class LoginViewModelInput {
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginModel? loginModel = LoginModel(email: '', password: '');
  Future<Result<bool, Failure>> login(
      {required String email, required String password});
  bool isFormValidate();
}

abstract class LoginViewModel extends LoginViewModelInput
    with TextFormFieldDelegate, BaseViewModel {}

class DefaultLoginViewModel extends LoginViewModel {
  // * Dependencies
  // * UseCases
  final SignInUseCase _signInUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  // * Constructor
  DefaultLoginViewModel(
      {SignInUseCase? signInUseCase,
      SaveLocalStorageUseCase? saveLocalStorageUseCase})
      : _signInUseCase = signInUseCase ?? DefaultSignInUseCase(),
        _saveLocalStorageUseCase =
            saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  @override
  void initState({required LoadingStateProvider loadingStateProvider}) {
    loadingState = loadingStateProvider;
  }

  @override
  bool isFormValidate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  Future<Result<bool, Failure>> login(
      {required String email, required String password}) {
    loadingState.setLoadingState(isLoading: true);

    return _signInUseCase
        .execute(
            params:
                SignInUseCaseBodyParameters(email: email, password: password))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          loadingState.setLoadingState(isLoading: false);
          _saveLocalStorageUseCase.execute(
              parameters: SaveLocalStorageParameters(
                  key: LocalStorageKeys.idToken,
                  value: result.value?.idToken ?? ""));

          return const Result.success(true);
        case ResultStatus.error:
          loadingState.setLoadingState(isLoading: false);
          return Result.failure(result.error);
      }
    });
  }

  @override
  onChanged(
      {required String newValue,
      required CustomTextFormFieldType customTextFormFieldType}) {
    switch (customTextFormFieldType) {
      case CustomTextFormFieldType.email:
        loginModel?.email = newValue;
        break;
      case CustomTextFormFieldType.password:
        loginModel?.password = newValue;
        break;
      case CustomTextFormFieldType.username:
        // TODO: Handle this case.
        break;
      case CustomTextFormFieldType.phone:
        // TODO: Handle this case.
        break;
      case CustomTextFormFieldType.dateOfBirth:
        // TODO: Handle this case.
        break;
    }
  }
}
