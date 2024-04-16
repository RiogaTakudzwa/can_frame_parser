import 'package:equatable/equatable.dart';

import '../../domain/entities/can_frame.dart';

abstract class CanFrameEvent extends Equatable {
  const CanFrameEvent();

  @override
  List<Object?> get props => [];
}

class OnGetVehicleCaptureEvent extends CanFrameEvent {
  final String currentVehicleDetails;
  const OnGetVehicleCaptureEvent(this.currentVehicleDetails);

  @override
  List<Object?> get props => [currentVehicleDetails];
}

class OnFilterArbitrationIDEvent extends CanFrameEvent {
  final String arbitrationID;
  const OnFilterArbitrationIDEvent(this.arbitrationID);

  @override
  List<Object?> get props => [arbitrationID];
}

class OnGetListOfCarsEvent extends CanFrameEvent {}