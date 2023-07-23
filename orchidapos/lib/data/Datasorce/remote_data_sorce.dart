

// code defines an abstract class RemoteDataSource and
// its implementation RemoteDataSourceImpl. The purpose of these classes is to provide a
// data source interface for making network requests to an API using the AppServiceClient class, 
//which is generated using the Retrofit library.

import 'package:orchidapos/data/network/app_api.dart';
import 'package:orchidapos/data/network/requests.dart';
import 'package:orchidapos/data/response/responses.dart';


abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);

  Future<AuthenticationResponse> register(RegisterRequest registerRequest);

  // Future<ForgotPasswordResponse> forgotPassword(String email);

  // Future<HomeResponse> getHomeData();

  // Future<StoreDetailsResponse> getStoreDetails();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }
  
  @override
  Future<AuthenticationResponse> register(RegisterRequest registerRequest) {
    // TODO: implement register
    throw UnimplementedError();
  }

  // @override
  // Future<ForgotPasswordResponse> forgotPassword(String email) async {
  //   return await _appServiceClient.forgotPassword(email);
  // }

  // @override
  // Future<AuthenticationResponse> register(
  //     RegisterRequest registerRequest) async {
  //   return await _appServiceClient.register(
  //       registerRequest.userName,
  //       registerRequest.countryMobileCode,
  //       registerRequest.mobileNumber,
  //       registerRequest.email,
  //       registerRequest.password,
  //       "");
  // }

  // @override
  // Future<HomeResponse> getHomeData() async {
  //   return await _appServiceClient.getHomeData();
  // }

  // @override
  // Future<StoreDetailsResponse> getStoreDetails() async {
  //   return await _appServiceClient.getStoreDetails();
  // }
}
