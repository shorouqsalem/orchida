


// import 'dart:async';

// import 'package:orchidapos/domain/usecase/login_usecase.dart';

// import '../../common/state_renderer/state_renderer_impl.dart';
// import '../../common/state_renderer/stste_renderer.dart';

// class LoginViewModel extends BaseViewModel
//     with LoginViewModelInputs, LoginViewModelOutputs {
//   final StreamController<String> _userNameStreamController =
//       StreamController<String>.broadcast();
//   final StreamController<String> _passwordStreamController =
//       StreamController<String>.broadcast();

//   final StreamController<void> _areAllInputsValidStreamController =
//       StreamController<void>.broadcast();

//   StreamController<bool> isUserLoggedInSuccessfullyStreamController =
//       StreamController<bool>();

//   var loginObject = LoginObject("", "");
//   final LoginUseCase _loginUseCase;

//   LoginViewModel(this._loginUseCase);

//   // inputs
//   @override
//   void dispose() {
//     super.dispose();
//     _userNameStreamController.close();
//     _passwordStreamController.close();
//     _areAllInputsValidStreamController.close();
//     isUserLoggedInSuccessfullyStreamController.close();
//   }

//   @override
//   void start() {
//     // view model should tell view please show content state
//     inputState.add(ContentState());
//   }

//   @override
//   Sink<String> get inputPassword => _passwordStreamController.sink;

//   @override
//   Sink<String> get inputUserName => _userNameStreamController.sink;

//   @override
//   Sink<void> get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

//   @override
//   setPassword(String password) {
//     inputPassword.add(password);
//     loginObject = loginObject.copyWith(password: password);
//     inputAreAllInputsValid.add(null);
//   }

//   @override
//   setUserName(String userName) {
//     inputUserName.add(userName);
//     loginObject = loginObject.copyWith(userName: userName);
//     inputAreAllInputsValid.add(null);
//   }

//   @override
//   login() async {
//     inputState.add(
//         LoadingState(stateRendererType: StateRendererType.popupLoadingState));
//     (await _loginUseCase.execute(
//             LoginUseCaseInput(loginObject.userName, loginObject.password)))
//         .fold(
//             (failure) => {
//                   // left -> failure
//                   inputState.add(ErrorState(
//                       StateRendererType.popupErrorState, failure.message))
//                 }, (data) {
//       // right -> data (success)
//       // content
//       inputState.add(ContentState());
//       // navigate to main screen
//       isUserLoggedInSuccessfullyStreamController.add(true);
//     });
//   }

//   // outputs
//   @override
//   Stream<bool> get outIsPasswordValid => _passwordStreamController.stream
//       .map((password) => _isPasswordValid(password));

//   @override
//   Stream<bool> get outIsUserNameValid => _userNameStreamController.stream
//       .map((userName) => _isUserNameValid(userName));

//   @override
//   Stream<bool> get outAreAllInputsValid =>
//       _areAllInputsValidStreamController.stream
//           .map((_) => _areAllInputsValid());

//   bool _isPasswordValid(String password) {
//     return password.isNotEmpty;
//   }

//   bool _isUserNameValid(String userName) {
//     return userName.isNotEmpty;
//   }

//   bool _areAllInputsValid() {
//     return _isPasswordValid(loginObject.password) &&
//         _isUserNameValid(loginObject.userName);
//   }
// }

// abstract class LoginViewModelInputs {
//   void setUserName(String userName);

//   void setPassword(String password);

//   void login();

//   Sink<String> get inputUserName;

//   Sink<String> get inputPassword;

//   Sink<void> get inputAreAllInputsValid;
// }

// abstract class LoginViewModelOutputs {
//   Stream<bool> get outIsUserNameValid;

//   Stream<bool> get outIsPasswordValid;

//   Stream<bool> get outAreAllInputsValid;
// }
