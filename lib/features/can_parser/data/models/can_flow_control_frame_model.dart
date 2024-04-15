import '../../domain/entities/can_flow_control_frame.dart';

class CanFlowControlFrameModel extends CanFlowControlFrame{

  const CanFlowControlFrameModel({
    required String timestamp,
    required String networkID,
    required String arbitrationID,
    required String protocolControlInfo,
    required String blockSize,
    required String separationTime,
  }) : super(
    timestamp: timestamp,
    networkID: networkID,
    arbitrationID: arbitrationID,
    protocolControlInfo: protocolControlInfo,
    blockSize: blockSize,
    separationTime: separationTime
  );

  factory CanFlowControlFrameModel.fromJson(Map<String, dynamic> json){
    return CanFlowControlFrameModel(
        timestamp: json["timestamp"] ?? "No Timestamp",
        networkID: json["networkID"] ?? "No Network ID",
        arbitrationID: json["arbitrationID"] ?? "No Arbitration ID",
        protocolControlInfo: json["protocolControlInfo"] ?? "No Protocol Control Info",
        blockSize: json["blockSize"] ?? "No Block Size",
        separationTime: json["separationTime"] ?? "No Separation Time"
    );
  }
}