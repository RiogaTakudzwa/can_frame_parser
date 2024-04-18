import 'package:can_frame_parser/features/can_parser/domain/entities/parsing_table.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handling/failure.dart';
import '../repositories/can_frame_parser_repository.dart';

class GetListOfParsingTables{

  final CanFrameParserRepository repository;
  GetListOfParsingTables(this.repository);

  Future<Either<Failure, List<Map<String, List<ParsingTable>>>>> execute(String carDetails){
    return repository.getParsingTables(carDetails);
  }
}