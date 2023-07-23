//This code defines an abstract class called BaseUseCase, which serves as a
// generic interface for executing use cases in the application. The use case represents
// a single operation or a sequence of related
// operations that fulfill a specific functionality or business logic. 

import 'package:dartz/dartz.dart';

import '../../data/network/failer.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
