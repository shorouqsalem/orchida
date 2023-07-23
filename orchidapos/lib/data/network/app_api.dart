

//This code defines an abstract class AppServiceClient using 
//the retrofit library, which is a type-safe HTTP client generator for Dart.
 import 'package:dio/dio.dart';
import 'package:orchidapos/app/constants.dart';
import 'package:retrofit/retrofit.dart';
part 'app_api.g.dart';


@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
 factory AppServiceClient(Dio dio ,{String baseUrl})= _AppServiceClient;

  get isConnected => null;

   @POST('/customers/login')
  Future login(
    @Field('userName') String userName,
    @Field('password') String password,
  );
  
  }
