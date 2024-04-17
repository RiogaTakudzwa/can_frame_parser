import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:yaml/yaml.dart';

import '../../../../../core/config/data_paths/local/local_paths.dart';
import '../../../../../core/error_handling/exception.dart';
import '../../../../../core/error_handling/failure.dart';
import '../../../domain/entities/can_frame.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io' as io;

import '../../../domain/entities/car.dart';
import '../../models/can_frame_model.dart';
import '../../models/car_model.dart';
import '../../models/parsing_table_model.dart';

abstract class CanFrameLocalDataSource{
  Future<List<CanFrameModel>> getLocalCanFrameData(String carDetails);
  Future<List<CarModel>> getListOfAvailableCars();
  Future<List<Map<String, List<ParsingTableModel>>>> getListOfParsingTables(String carDetails);
}

class CanFrameLocalDataSourceImplementation extends CanFrameLocalDataSource{

  @override
  Future<List<CanFrameModel>> getLocalCanFrameData(String carDetails) async{
    try{
      final String response = await rootBundle.loadString("${LocalPaths.vehicleCapturesData}$carDetails.log");
      List<String> singleLines = const LineSplitter().convert(response);

      List<CanFrameModel> listOfFrames = [];

      try{
        for(String singleFrame in singleLines){

          var parts = singleFrame.split(RegExp(r'[# " "]'));
          listOfFrames.add(CanFrameModel.fromJson({
            "timestamp": double.parse(parts[0].substring(1, parts[0].length -1)),
            "networkID": parts[1],
            "arbitrationID": parts[2],
            "dataFrame": parts[3].padRight(8, 'A'),
          }));
        }

        return listOfFrames;

      }on JsonParseException{
        throw JsonParseException();
      }

    }on IOException{
      throw  LocalIOException();
    }
  }

  @override
  Future<List<CarModel>> getListOfAvailableCars() async {
    try{

      final String response = await rootBundle.loadString(LocalPaths.carsListData);
      List<CarModel> listOfCars = [];

      try{
        final jsonData = await json.decode(response);

        for(Map<String, dynamic> car in jsonData["cars"]){
          listOfCars.add(CarModel.fromJson(car));
        }

        return listOfCars;

      }on JsonParseException{
        throw JsonParseException();
      }

    }on IOException{
      throw  LocalIOException();
    }
  }

  @override
  Future<List<Map<String, List<ParsingTableModel>>>> getListOfParsingTables(String carDetails) async {
    try{
      final parsingTablesInFolder = json.decode(await rootBundle.loadString('AssetManifest.json')).keys
          .where((String key) => key.contains("${LocalPaths.yamlFiles}/$carDetails/"))
          .toList();

      List<Map<String, List<ParsingTableModel>>> parsingTableModels = [];

      try{
        for(String tablePath in parsingTablesInFolder){

          Map<String, List<ParsingTableModel>> temp = {};
          List<ParsingTableModel> tempList = [];

          var doc = loadYaml(await rootBundle.loadString(tablePath));
          var result = json.decode(json.encode(doc)); // A Map

          for(Map<String, dynamic> tableItem in result){
            tempList.add(ParsingTableModel.fromJson(tableItem));
          }

          var parts = tablePath.split(RegExp(r'[/ .]'));

          temp.addAll({parts.elementAt(parts.length -2): tempList});
          parsingTableModels.add(temp);
        }

        return parsingTableModels;

      }on JsonParseException{
        throw JsonParseException();
      }

    }on IOException{
      throw  LocalIOException();
    }
  }
}