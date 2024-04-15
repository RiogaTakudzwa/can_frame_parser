import 'package:equatable/equatable.dart';

class FirstFrameCanResponseFrame extends Equatable{
  final String timestamp;
  final String networkID;
  final String arbitrationID;
  final String protocolControlInfo;
  final String messageLength;
  final String subFunctionResponseCode;
  final String requestDataParametersEcho;
  final String responseDataParameters;

  const FirstFrameCanResponseFrame({
    required this.timestamp,
    required this.networkID,
    required this.arbitrationID,
    required this.protocolControlInfo,
    required this.messageLength,
    required this.subFunctionResponseCode,
    required this.requestDataParametersEcho,
    required this.responseDataParameters,
  });

  @override
  List<Object?> get props => [
    timestamp,
    networkID,
    arbitrationID,
    protocolControlInfo,
    messageLength,
    subFunctionResponseCode,
    requestDataParametersEcho,
    responseDataParameters,
  ];

}