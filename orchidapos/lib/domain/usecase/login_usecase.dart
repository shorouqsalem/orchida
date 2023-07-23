import 'package:dartz/dartz.dart';
import 'package:orchidapos/data/network/failer.dart';
import 'package:orchidapos/data/network/requests.dart';
import 'package:orchidapos/domain/model/models.dart';
import 'package:orchidapos/domain/usecase/base_useCase.dart';

import '../repository/repository.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(input.userName, input.password));
  }
}

class LoginUseCaseInput {
  String userName;
  String password;

  LoginUseCaseInput(this.userName, this.password);
}