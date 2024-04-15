import 'package:equatable/equatable.dart';

class ConsecutiveCanResponseFrame extends Equatable{
  final String timestamp;
  final String networkID;
  final String arbitrationID;
  final String protocolControlInfo;
  final String responseDataParameters;

  const ConsecutiveCanResponseFrame({
    required this.timestamp,
    required this.networkID,
    required this.arbitrationID,
    required this.protocolControlInfo,
    required this.responseDataParameters,
  });

  @override
  List<Object?> get props => [
    timestamp,
    networkID,
    arbitrationID,
    protocolControlInfo,
    responseDataParameters
  ];
}