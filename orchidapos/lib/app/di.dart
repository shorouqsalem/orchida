import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:orchidapos/app/app_pref.dart';
import 'package:orchidapos/data/network/app_api.dart';
import 'package:orchidapos/data/network/dio_factory.dart';
import 'package:orchidapos/domain/usecase/login_usecase.dart';
import 'package:orchidapos/presntation/login/view_model/login_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/Datasorce/remote_data_sorce.dart';
import '../data/network/network_info.dart';
import '../domain/repository/repository.dart';




final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies

  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();
  //app service client
  
  ///instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source

  //instance.registerLazySingleton<RemoteDataSource>(
     // () => RemoteDataSourceImpl(instance<AppServiceClient>()));

  // local data source
 // instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  // repository

  // instance.registerLazySingleton<Repository>(
  //     () => RepositoryImpl(instance(), instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
   // instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

// initForgotPasswordModule() {
//   if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
//     instance.registerFactory<ForgotPasswordUseCase>(
//         () => ForgotPasswordUseCase(instance()));
//     instance.registerFactory<ForgotPasswordViewModel>(
//         () => ForgotPasswordViewModel(instance()));
//   }
// }

// initRegisterModule() {
//   if (!GetIt.I.isRegistered<RegisterUseCase>()) {
//     instance
//         .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
//     instance.registerFactory<RegisterViewModel>(
//         () => RegisterViewModel(instance()));
//     instance.registerFactory<ImagePicker>(() => ImagePicker());
//   }
// }

// initHomeModule() {
//   if (!GetIt.I.isRegistered<HomeUseCase>()) {
//     instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
//     instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
//   }
// }

// initStoreDetailsModule() {
//   if (!GetIt.I.isRegistered<StoreDetailsUseCase>()) {
//     instance.registerFactory<StoreDetailsUseCase>(
//         () => StoreDetailsUseCase(instance()));
//     instance.registerFactory<StoreDetailsViewModel>(
//         () => StoreDetailsViewModel(instance()));
//   }
// }
