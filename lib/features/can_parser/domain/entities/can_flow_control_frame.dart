import 'package:equatable/equatable.dart';

class CanFlowControlFrame extends Equatable{
  final String timestamp;
  final String networkID;
  final String arbitrationID;
  final String protocolControlInfo;
  final String blockSize;
  final String separationTime;

  const CanFlowControlFrame({
    required this.timestamp,
    required this.networkID,
    required this.arbitrationID,
    required this.protocolControlInfo,
    required this.blockSize,
    required this.separationTime,
  });

  @override
  List<Object?> get props => [
    timestamp,
    networkID,
    arbitrationID,
    protocolControlInfo,
    blockSize,
    separationTime,
  ];
}