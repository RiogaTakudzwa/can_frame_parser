import 'package:can_frame_parser/core/error_handling/failure.dart';
import 'package:can_frame_parser/features/can_parser/data/data_source/local/local_data_source.dart';
import 'package:can_frame_parser/features/can_parser/domain/entities/can_frame.dart';
import 'package:can_frame_parser/features/can_parser/domain/entities/car.dart';
import 'package:can_frame_parser/features/can_parser/domain/entities/parsing_sheet.dart';
import 'package:can_frame_parser/features/can_parser/domain/repositories/can_frame_parser_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handling/exception.dart';
import '../../domain/entities/parsing_table.dart';
import '../models/can_frame_model.dart';
import '../models/car_model.dart';
import '../models/parsing_table_model.dart';

class CanFrameParserRepositoryImplementation extends CanFrameParserRepository{

  final CanFrameLocalDataSource canFrameLocalDataSource;
  CanFrameParserRepositoryImplementation({
    required this.canFrameLocalDataSource
  });

  @override
  Future<Either<Failure, List<Car>>> getListOfAvailableCars() async {
    try{
      List<CarModel> carModels = await canFrameLocalDataSource.getListOfAvailableCars();
      List<Car> carEntities = [];
      for(CarModel model in carModels){
        carEntities.add(model.toEntity());
      }
      return Right(carEntities);
    }on LocalIOException{
      return const Left(LocalIOFailure("Failed to load Local Data. Please check if vehicle capture data exists"));
    }on JsonParseException{
      return const Left(JsonParseFailure("Failed to parse Json Data"));
    }
  }

  @override
  Future<Either<Failure, List<Map<String, List<ParsingTable>>>>> getParsingTables(String carDetails) async {
    try{
      List<Map<String, List<ParsingTableModel>>> table = await canFrameLocalDataSource.getListOfParsingTables(carDetails);
      List<Map<String, List<ParsingTable>>> parsingTableEntities = [];

      for(Map<String, List<ParsingTableModel>> model in table){
        Map<String, List<ParsingTable>> temp = {};
        List<ParsingTable> tempModelList = [];

        for(ParsingTableModel singleModel in model[model.keys.first]!){
          tempModelList.add(singleModel.toEntity());
        }

        temp.addAll({model.keys.first: tempModelList});
        parsingTableEntities.add(temp);
      }
      return Right(parsingTableEntities);
    }on LocalIOException{
      return const Left(LocalIOFailure("Failed to load Local Data. Please check if vehicle capture data exists"));
    }on JsonParseException{
      return const Left(JsonParseFailure("Failed to parse Json Data"));
    }
  }

  @override
  Future<Either<Failure, List<CanFrame>>> getVehicleCapture(String carDetails) async {
    try{
      List<CanFrameModel> models = await canFrameLocalDataSource.getLocalCanFrameData(carDetails);
      List<CanFrame> frameEntities = [];
      for(CanFrameModel model in models){
        frameEntities.add(model.toEntity());
      }
      return Right(frameEntities);
    }on LocalIOException{
      return const Left(LocalIOFailure("Failed to load Local Data. Please check if vehicle capture data exists"));
    }on JsonParseException{
      return const Left(JsonParseFailure("Failed to parse Json Data"));
    }
  }

  @override
  Future<Either<Failure, List<CanFrame>>> filterCanFramesByArbitrationID(String arbitrationID) {
    // TODO: implement filterCanFramesByArbitrationID
    throw UnimplementedError();
  }

}