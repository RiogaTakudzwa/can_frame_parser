import 'package:equatable/equatable.dart';

import '../../domain/entities/can_frame.dart';
import '../../domain/entities/car.dart';

abstract class CanFrameState extends Equatable {
  const CanFrameState();

  @override
  List<Object?> get props => [];
}

/// Loading Can Frame data
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

/// Loading list of Cars
class EmptyListOfCarsState extends CanFrameState {}

class LoadingListOfCarsState extends CanFrameState {}

class ListOfCarsLoadedState extends CanFrameState {
  final List<Car> listOfCars;

  const ListOfCarsLoadedState(this.listOfCars);

  @override
  List<Object?> get props => [listOfCars];
}

class ErrorLoadingListOfCarsState extends CanFrameState {
  final String errorMessage;

  const ErrorLoadingListOfCarsState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}