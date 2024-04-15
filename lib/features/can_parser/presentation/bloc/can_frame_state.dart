import 'package:equatable/equatable.dart';

import '../../domain/entities/can_frame.dart';

abstract class CanFrameState extends Equatable {
  const CanFrameState();

  @override
  List<Object?> get props => [];
}

class CanFrameDataEmptyState extends CanFrameState {}

class LoadingCanFrameDataState extends CanFrameState {}

class CanFrameDataLoadedState extends CanFrameState {
  final List<CanFrame> vehicleCaptureData;

  const CanFrameDataLoadedState(this.vehicleCaptureData);

  @override
  List<Object?> get props => [vehicleCaptureData];
}

class ErrorLoadingCanFrameDataState extends CanFrameState {
  final String errorMessage;

  const ErrorLoadingCanFrameDataState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
