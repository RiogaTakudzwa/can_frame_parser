import 'package:equatable/equatable.dart';

class CanFrame extends Equatable{
  final double timestamp;
  final String networkID;
  final String arbitrationID;
  final String dataFrame;

  const CanFrame({
    required this.timestamp,
    required this.networkID,
    required this.arbitrationID,
    required this.dataFrame,
  });

  @override
  List<Object?> get props => [
    timestamp,
    networkID,
    arbitrationID,
    dataFrame
  ];
}