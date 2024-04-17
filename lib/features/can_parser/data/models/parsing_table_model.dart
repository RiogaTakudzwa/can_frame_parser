import '../../domain/entities/arbitration_ID.dart';
import '../../domain/entities/parsing_table.dart';
import 'arbitration_ID_model.dart';

class ParsingTableModel extends ParsingTable {

  const ParsingTableModel({
    required String name,
    required ArbitrationID arbitrationId,
    required String serviceId,
    required Type type,
    required int pid,
    required int pidWidth,
    required int startBit,
    required int width,
    required double? scalar,
    required double? offset,
    required String? units,
    required List<Enum>? parsingTableEnum,
  }) : super(
      name: name,
      arbitrationId: arbitrationId,
      serviceId: serviceId,
      type: type,
      pid: pid,
      pidWidth: pidWidth,
      startBit: startBit,
      width: width,
      scalar: scalar,
      offset: offset,
      units: units,
      parsingTableEnum: parsingTableEnum
  );

  factory ParsingTableModel.fromJson(Map<String, dynamic> json) => ParsingTableModel(
    name: json["Name"],
    arbitrationId: ArbitrationIDModel.fromJson(json["ArbitrationID"]),
    serviceId: json["ServiceID"],
    type: typeValues.map[json["Type"]]!,
    pid: json["PID"],
    pidWidth: json["PIDWidth"],
    startBit: json["StartBit"],
    width: json["Width"],
    scalar: json["Scalar"]?.toDouble(),
    offset: json["Offset"]?.toDouble(),
    units: json["Units"],
    parsingTableEnum: json["Enum"] == null ? [] : List<Enum>.from(json["Enum"]!.map((x) => Enum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "ArbitrationID": ArbitrationIDModel(rx: arbitrationId.rx, tx: arbitrationId.tx).toJson(),
    "ServiceID": serviceId,
    "Type": typeValues.reverse[type],
    "PID": pid,
    "PIDWidth": pidWidth,
    "StartBit": startBit,
    "Width": width,
    "Scalar": scalar,
    "Offset": offset,
    "Units": units,
    "Enum": parsingTableEnum == null ? [] : List<dynamic>.from(parsingTableEnum!.map((x) => x.toJson())),
  };

  ParsingTable toEntity() => ParsingTable(
    name: name,
    arbitrationId: arbitrationId,
    serviceId: serviceId,
    type: type,
    pid: pid,
    pidWidth: pidWidth,
    startBit: startBit,
    width: width,
    scalar: scalar,
    offset: offset,
    units: units,
    parsingTableEnum: parsingTableEnum
  );

}