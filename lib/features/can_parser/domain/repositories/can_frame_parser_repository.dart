import 'package:dartz/dartz.dart';

import '../../../../core/error_handling/failure.dart';
import '../entities/can_frame.dart';
import '../entities/car.dart';
import '../entities/parsing_sheet.dart';

abstract class CanFrameParserRepository{
  Future<Either<Failure, List<Car>>> getListOfAvailableCars();
  Future<Either<Failure, ParsingSheet>> getParsingSheet(String carDetails);
  Future<Either<Failure, List<CanFrame>>> getVehicleCapture(String carDetails);
  Future<Either<Failure, List<CanFrame>>> filterCanFramesByArbitrationID(String arbitrationID);
}