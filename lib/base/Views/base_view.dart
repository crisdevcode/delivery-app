import 'package:delivery/base/Views/loading_view.dart';
import 'package:delivery/features/presentation/StateProviders/error_state_provider.dart';
import 'package:delivery/features/presentation/StateProviders/loading_state_provider.dart';
import 'package:delivery/features/presentation/main_coordinator/main_coordinator.dart';
import 'package:flutter/material.dart';

class BaseView {
  final MainCoordinator coordinator = MainCoordinator();
  final Widget loadingView = const LoadingView();
  final ErrorStateProvider errorStateProvider = ErrorStateProvider();
}

abstract class BaseViewModel {
  late LoadingStateProvider loadingState;
  void initState({required LoadingStateProvider loadingStateProvider});
}
