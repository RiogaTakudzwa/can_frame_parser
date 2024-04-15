import 'package:equatable/equatable.dart';

import '../../domain/entities/can_frame.dart';

abstract class CanFrameEvent extends Equatable {
  const CanFrameEvent();

  @override
  List<Object?> get props => [];
}

class OnGetVehicleCaptureEvent extends CanFrameEvent {
  final List<CanFrame> vehicleCaptureData;
  const OnGetVehicleCaptureEvent(this.vehicleCaptureData);

  @override
  List<Object?> get props => [vehicleCaptureData];
}

class OnFilterArbitrationIDEvent extends CanFrameEvent {
  final String arbitrationID;
  const OnFilterArbitrationIDEvent(this.arbitrationID);

  @override
  List<Object?> get props => [arbitrationID];
}