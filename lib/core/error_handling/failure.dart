import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable implements Exception{
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure{
  const ServerFailure(super.message);
}

class JsonParseFailure extends Failure{
  const JsonParseFailure(super.message);
}

class LocalIOFailure extends Failure{
  const LocalIOFailure(super.message);
}
