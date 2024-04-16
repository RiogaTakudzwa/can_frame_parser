import 'package:dartz/dartz.dart';

import '../../../../core/error_handling/failure.dart';
import '../entities/car.dart';
import '../repositories/can_frame_parser_repository.dart';

class GetListOfAvailableCars{

  final CanFrameParserRepository repository;
  GetListOfAvailableCars(this.repository);

  Future<Either<Failure,List<Car>>> execute(){
    return repository.getListOfAvailableCars();
  }
}