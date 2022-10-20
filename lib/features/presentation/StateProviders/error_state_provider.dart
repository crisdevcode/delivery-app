import 'package:delivery/base/api_service/app_error.dart';
import 'package:delivery/features/presentation/common_widgets/Alerts/error_alert_view.dart';
import 'package:flutter/material.dart';

abstract class ErrorStateProviderDelegate {
  void setFailure({required BuildContext context, required Failure value});
}

class ErrorStateProvider extends ChangeNotifier
    with ErrorStateProviderDelegate {
  late Failure _failure;

  @override
  void setFailure({required BuildContext context, required Failure value}) {
    _failure = value;
    _showAlert(context: context, message: _failure.toString());

    notifyListeners();
  }

  void _showAlert({required BuildContext context, required String message}) {
    ErrorAlertView.showErrorAlertDialog(
        context: context,
        subtitle: message,
        ctaButtonAction: () {
          Navigator.pop(context);
        });
  }
}
