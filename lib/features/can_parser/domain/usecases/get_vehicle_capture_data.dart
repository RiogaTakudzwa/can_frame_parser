import 'package:can_frame_parser/core/error_handling/failure.dart';
import 'package:can_frame_parser/features/can_parser/domain/entities/can_frame.dart';
import 'package:can_frame_parser/features/can_parser/domain/repositories/can_frame_parser_repository.dart';
import 'package:dartz/dartz.dart';

class GetVehicleCaptureData{

  final CanFrameParserRepository repository;
  GetVehicleCaptureData(this.repository);

  Future<Either<Failure,List<CanFrame>>> execute(String carDetails){
    return repository.getVehicleCapture(carDetails);
  }
}