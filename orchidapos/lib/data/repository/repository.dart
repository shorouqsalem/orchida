

//this code represents the implementation of the Repository interface, 
//which acts as an abstraction layer between the domain layer (use cases) and the data layer (data sources). 

import 'package:dartz/dartz.dart';
import 'package:orchidapos/data/Datasorce/remote_data_sorce.dart';
import 'package:orchidapos/data/network/error_handeler.dart';
import 'package:orchidapos/data/network/failer.dart';
import 'package:orchidapos/data/network/network_info.dart';
import 'package:orchidapos/data/network/requests.dart';
import 'package:orchidapos/domain/repository/repository.dart';

import '../../domain/model/models.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  //final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo
      );

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.login(loginRequest);

        if (response.status == ApiInternalStatus.SUCCESS) {
          // success
          // return either right
          // return data
         // return Right(response.toDomain());
          return Right(response as Authentication);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.massage ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  
  @override
  Future<Either<Failure, String>> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, HomeObject>> getHomeData() {
    // TODO: implement getHomeData
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, StoreDetails>> getStoreDetails() {
    // TODO: implement getStoreDetails
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, Authentication>> register(RegisterRequest registerRequest) {
    // TODO: implement register
    throw UnimplementedError();
  }

}