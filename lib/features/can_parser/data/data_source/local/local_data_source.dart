import 'dart:convert';
import 'dart:io';

import '../../../../../core/config/data_paths/local/local_paths.dart';
import '../../../../../core/error_handling/exception.dart';
import '../../../../../core/error_handling/failure.dart';
import '../../../domain/entities/can_frame.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../models/can_frame_model.dart';

abstract class CanFrameLocalDataSource{
  Future<List<CanFrameModel>> getLocalCanFrameData(String carDetails);
}

class CanFrameLocalDataSourceImplementation extends CanFrameLocalDataSource{

  @override
  Future<List<CanFrameModel>> getLocalCanFrameData(String carDetails) async{
    try{
      final String response = await rootBundle.loadString("${LocalPaths.vehicleCapturesData}$carDetails.json");
      List<CanFrameModel> listOfFrames = [];

      try{
        final jsonData = await json.decode(response);

        for(Map<String, dynamic> singleFrame in jsonData){
          listOfFrames.add(CanFrameModel.fromJson(singleFrame));
        }

        return listOfFrames;

      }on JsonParseException{
        throw JsonParseException();
      }

    }on IOException{
      throw  LocalIOException();
    }
  }
}