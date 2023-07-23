import 'dart:async';

import '../common/state_renderer/state_renderer_impl.dart';






mixin BaseViewModelInputs {
  void start(); // start view model job

  void dispose(); // will be called when view model dies

  Sink get inputState;
}

mixin BaseViewModelOutputs {
  Stream<FlowState> get outputState;
}

abstract class BaseViewModel implements BaseViewModelInputs, BaseViewModelOutputs {
  // shared variables and functions that will be used through any view model.
  final StreamController<FlowState> _inputStreamController =
      StreamController<FlowState>();

  @override
  Sink get inputState => _inputStreamController.sink;

  @override
  Stream<FlowState> get outputState => _inputStreamController.stream;

  @override
  void dispose() {
    _inputStreamController.close();
  }
}

mixin LoginViewModelInputs {
  void setUserName(String userName);

  void setPassword(String password);

  void login();

  Sink get inputUserName;

  Sink get inputPassword;

  Sink get inputAreAllInputsValid;
}

mixin LoginViewModelOutputs {
  Stream<bool> get outIsUserNameValid;

  Stream<bool> get outIsPasswordValid;

  Stream<bool> get outAreAllInputsValid;
}


