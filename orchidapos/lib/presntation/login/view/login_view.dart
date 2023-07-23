// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:orchidapos/app/app_pref.dart';
// import 'package:orchidapos/app/di.dart';
// import 'package:orchidapos/presntation/common/state_renderer/state_renderer_impl.dart';
// import 'package:orchidapos/presntation/resources/assets_manager.dart';
// import 'package:orchidapos/presntation/resources/color_manager.dart';
// import 'package:orchidapos/presntation/resources/routes_manager.dart';
// import 'package:orchidapos/presntation/resources/strings_manager.dart';
// import 'package:orchidapos/presntation/resources/values_manager.dart';

// class LoginView extends StatefulWidget {
//   const LoginView({Key? key}) : super(key: key);

//   @override
//   _LoginViewState createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
//   final LoginViewModel _viewModel = instance<LoginViewModel>();
  

//   final AppPreferences _appPreferences = instance<AppPreferences>();

//   final TextEditingController _userNameController = TextEditingController();
//   final TextEditingController _userPasswordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   _bind() {
//     _viewModel.start(); // tell viewmodel, start ur job
//     _userNameController
//         .addListener(() => _viewModel.setUserName(_userNameController.text));
//     _userPasswordController.addListener(
//         () => _viewModel.setPassword(_userPasswordController.text));

//     _viewModel.isUserLoggedInSuccessfullyStreamController.stream
//         .listen((isLoggedIn) {
//       if (isLoggedIn) {
//         // navigate to main screen
//         SchedulerBinding.instance?.addPostFrameCallback((_) {
//           _appPreferences.setUserLoggedIn();
//           Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
//         });
//       }
//     });
//   }

//   @override
//   void initState() {
//     _bind();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.white,
//       body: StreamBuilder<FlowState>(
//         stream: _viewModel.outputState,
//         builder: (context, snapshot) {
//           return snapshot.data?.getScreenWidget(context, _getContentWidget(),
//                   () {
//                 _viewModel.login();
//               }) ??
//               _getContentWidget();
//         },
//       ),
//     );
//   }

//   Widget _getContentWidget() {
//     return Container(
//         padding: const EdgeInsets.only(top: AppPadding.p100),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 const Center(
//                     child: Image(image: AssetImage(ImageAssets.splashLogo))),
//                 const SizedBox(
//                   height: AppSize.s28,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       left: AppPadding.p28, right: AppPadding.p28),
//                   child: StreamBuilder<bool>(
//                       stream: _viewModel.outIsUserNameValid,
//                       builder: (context, snapshot) {
//                         return TextFormField(
//                           keyboardType: TextInputType.emailAddress,
//                           controller: _userNameController,
//                           decoration: InputDecoration(
//                               hintText: AppStrings.username.tr(),
//                               labelText: AppStrings.username.tr(),
//                               errorText: (snapshot.data ?? true)
//                                   ? null
//                                   : AppStrings.usernameError.tr()),
//                         );
//                       }),
//                 ),
//                 const SizedBox(
//                   height: AppSize.s28,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       left: AppPadding.p28, right: AppPadding.p28),
//                   child: StreamBuilder<bool>(
//                       stream: _viewModel.outIsPasswordValid,
//                       builder: (context, snapshot) {
//                         return TextFormField(
//                           keyboardType: TextInputType.visiblePassword,
//                           controller: _userPasswordController,
//                           decoration: InputDecoration(
//                               hintText: AppStrings.password,
//                               labelText: AppStrings.password,
//                               errorText: (snapshot.data ?? true)
//                                   ? null
//                                   : AppStrings.passwordError.tr()),
//                         );
//                       }),
//                 ),
//                 const SizedBox(
//                   height: AppSize.s28,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       left: AppPadding.p28, right: AppPadding.p28),
//                   child: StreamBuilder<bool>(
//                       stream: _viewModel.outAreAllInputsValid,
//                       builder: (context, snapshot) {
//                         return SizedBox(
//                           width: double.infinity,
//                           height: AppSize.s40,
//                           child: ElevatedButton(
//                               onPressed: (snapshot.data ?? false)
//                                   ? () {
//                                       _viewModel.login();
//                                     }
//                                   : null,
//                               child: Text(AppStrings.login.tr())),
//                         );
//                       }),
//                 ),
//                 Padding(
//                     padding: const EdgeInsets.only(
//                         top: AppPadding.p8,
//                         left: AppPadding.p28,
//                         right: AppPadding.p28),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pushNamed(
//                                 context, Routes.forgotPasswordRoute);
//                           },
//                           child: Text(AppStrings.forgetPassword.tr(),
//                               style: Theme.of(context).textTheme.titleMedium),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pushNamed(context, Routes.registerRoute);
//                           },
//                           child: Text(AppStrings.registerText,
//                               style: Theme.of(context).textTheme.titleMedium).tr(),
//                         )
//                       ],
//                     )),
//               ],
//             ),
//           ),
//         ));
//   }

//   @override
//   void dispose() {
//     _viewModel.dispose();
//     super.dispose();
//   }
// }


import 'package:flutter/material.dart';
import 'package:orchidapos/presntation/home/home_ui.dart';
import 'package:orchidapos/presntation/resources/color_manager.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenWidth * 0.07,
        ),
        child: Column(
          children: [
            SizedBox(height: screenWidth * 0.15),
            Center(
              child: Container(
                width: screenWidth * 0.4,
                height: screenWidth * 0.4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: screenWidth * 0.01,
                    color: Colors.white,
                  ),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: screenWidth * 0.005,
                      blurRadius: screenWidth * 0.025,
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, screenWidth * 0.05),
                    )
                  ],
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://scontent.famm7-1.fna.fbcdn.net/v/t39.30808-1/322162827_2299627430217275_1308927338195981873_n.jpg?stp=dst-jpg_p320x320&_nc_cat=104&ccb=1-7&_nc_sid=c6021c&_nc_eui2=AeElOaAAMnkVKbSRZvN-_CFsDF7T8uVcrDMMXtPy5VysM99d9AGg6ssFhHQmENHEuQ27GwbbaT-2TMFQ48oHcZwT&_nc_ohc=mqTDeeSRDYMAX9LOGEo&_nc_ht=scontent.famm7-1.fna&oh=00_AfC6AbwqxBtN1MtDDYq90onDTe5gDQ2QRuePGvbSOtqzCg&oe=647E73E6',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.12),
            buildTextField(
              hintText: 'Email OR UserName',
              screenWidth: screenWidth,
            ),
            buildTextField(
              hintText: 'Password',
              screenWidth: screenWidth,
            ),
            SizedBox(height: screenWidth * 0.02),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Row(
                children: [
                  Checkbox(
                    activeColor: ColorManager.primary,
                    checkColor: Colors.white,
                    value: rememberMe,
                    onChanged: (val) {
                      setState(() {
                        rememberMe = val!;
                      });
                    },
                  ),
                  Text(
                    'Remember Me',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: ColorManager.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.1),
                  Text(
                    'Forget Password ?',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: ColorManager.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.04),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ColorManager.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(160, screenWidth * 0.10),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, anotherAnimation) {
                        return const HomePage();
                      },
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t Have an Account? ',
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    color: ColorManager.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Sign Up Now',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: ColorManager.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    required String hintText,
    required double screenWidth,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenWidth * 0.05),
      child: TextFormField(
        validator: (val) {
          if (val!.length > 100) {
            return "Email can't be longer than 100 characters";
          }
          if (val.length < 2) {
            return "Email must be at least 2 characters";
          }
          return null;
        },
        cursorColor: ColorManager.primary,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorManager.darkGrey,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.1),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.1),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.all(screenWidth * 0.03),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: screenWidth * 0.025,
            color: ColorManager.primary,
          ),
        ),
      ),
    );
  }
}

