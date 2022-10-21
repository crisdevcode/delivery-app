import 'package:delivery/base/Views/base_view.dart';
import 'package:flutter/material.dart';
import 'package:delivery/base/api_service/app_error.dart';
import 'package:delivery/base/constants/local_storage_keys.dart';
import 'package:delivery/features/domain/uses_cases/LocalStorage/local_storage_use_case_parameters.dart';
import 'package:delivery/features/domain/uses_cases/LocalStorage/save_local_storage_use_case.dart';
import 'package:delivery/features/domain/uses_cases/auth/sign_up_use_case/sign_up_use_case.dart';
import 'package:delivery/features/domain/uses_cases/auth/sign_up_use_case/sign_up_use_case_parameters.dart';
import 'package:delivery/features/presentation/StateProviders/loading_state_provider.dart';
import 'package:delivery/features/presentation/common_widgets/TexFormFields/custom_text_form_field.dart';
import 'package:delivery/features/presentation/sign_up_page/Model/sign_up_model.dart';
import 'package:delivery/utils/Helpers/ResultType/ResultType.dart';

abstract class SignUpViewModelInput {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController dateController;
  late DateTime selectedDate;
  SignUpModel? signUpModel = SignUpModel();

  Future<Result<bool, Failure>> signUp();
  bool isFormValidate();
}

abstract class SignUpViewModel extends SignUpViewModelInput
    with TextFormFieldDelegate, BaseViewModel {}

class DefaultSignUpViewModel extends SignUpViewModel {
  // Dependencias
  final SignUpUseCase _signUpUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  DefaultSignUpViewModel(
      {SignUpUseCase? signUpUseCase,
      SaveLocalStorageUseCase? saveLocalStorageUseCase})
      : _signUpUseCase = signUpUseCase ?? DefaultSignUpUseCase(),
        _saveLocalStorageUseCase =
            saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  @override
  void initState({required LoadingStateProvider loadingStateProvider}) {
    loadingState = loadingStateProvider;
    dateController = TextEditingController();
    selectedDate = DateTime.now();
  }

  @override
  bool isFormValidate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  Future<Result<bool, Failure>> signUp() {
    loadingState.setLoadingState(isLoading: true);

    return _signUpUseCase
        .execute(
            params: SignUpUseCaseParameters(
                username: signUpModel?.username ?? "",
                email: signUpModel?.email ?? "",
                password: signUpModel?.password ?? "",
                phone: signUpModel?.phone ?? "",
                date: signUpModel?.date))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          _saveLocalStorageUseCase.execute(
              parameters: SaveLocalStorageParameters(
                  key: LocalStorageKeys.idToken,
                  value: result.value?.idToken ?? ""));
          loadingState.setLoadingState(isLoading: false);
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
        signUpModel?.email = newValue;
        break;
      case CustomTextFormFieldType.password:
        signUpModel?.password = newValue;
        break;
      case CustomTextFormFieldType.username:
        signUpModel?.username = newValue;
        break;
      case CustomTextFormFieldType.phone:
        signUpModel?.phone = newValue;
        break;
      case CustomTextFormFieldType.dateOfBirth:
        signUpModel?.date = newValue;
        break;
    }
  }
}
