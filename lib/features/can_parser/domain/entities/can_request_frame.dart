import 'package:equatable/equatable.dart';

class CanRequestFrame extends Equatable{
  final String timestamp;
  final String networkID;
  final String arbitrationID;
  final String protocolControlInfo;
  final String serviceID;
  final String subFunction;
  final String requestDataParameters;

  const CanRequestFrame({
    required this.timestamp,
    required this.networkID,
    required this.arbitrationID,
    required this.protocolControlInfo,
    required this.serviceID,
    required this.subFunction,
    required this.requestDataParameters,
  });

  @override
  List<Object?> get props => [
    timestamp,
    networkID,
    arbitrationID,
    protocolControlInfo,
    serviceID,
    subFunction,
    requestDataParameters
  ];

}