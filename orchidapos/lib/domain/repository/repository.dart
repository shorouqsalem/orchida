//This code defines an abstract class called Repository, which serves as an interface
// for data access and retrieval operations in the application. The repository is responsible for 
//interacting with different data sources,
// such as remote APIs, local databases, or any other data providers

import '../../data/network/failer.dart';
import '../../data/network/requests.dart';
import '../model/models.dart';
import 'package:dartz/dartz.dart';



abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);

  Future<Either<Failure, String>> forgotPassword(String email);

  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest);

  Future<Either<Failure, HomeObject>> getHomeData();

  Future<Either<Failure, StoreDetails>> getStoreDetails();
}
