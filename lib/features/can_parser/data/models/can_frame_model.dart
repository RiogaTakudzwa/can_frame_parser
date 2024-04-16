import '../../domain/entities/can_frame.dart';

class CanFrameModel extends CanFrame{

  const CanFrameModel({
   required double timestamp,
   required String networkID,
   required String arbitrationID,
   required String dataFrame,
  }) : super(
    timestamp: timestamp,
    networkID: networkID,
    arbitrationID: arbitrationID,
    dataFrame: dataFrame
  );

  factory CanFrameModel.fromJson(Map<String, dynamic> json){
    return CanFrameModel(
      timestamp: json["timestamp"] ?? 0.0,
      networkID: json["networkID"] ?? "No Network ID",
      arbitrationID: json["arbitrationID"] ?? "No Arbitration ID",
      dataFrame: json["dataFrame"] ?? "No Data Frame",
    );
  }

  CanFrame toEntity() => CanFrame(
    timestamp: timestamp,
    networkID: networkID,
    arbitrationID: arbitrationID,
    dataFrame: dataFrame,
  );
}