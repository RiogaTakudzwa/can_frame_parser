part of 'car_list_bloc.dart';

abstract class CarListState extends Equatable{
  const CarListState();

  @override
  List<Object?> get props => [];
}

/// Loading list of Cars
class EmptyListOfCarsState extends CarListState {}

class LoadingListOfCarsState extends CarListState {}

class ListOfCarsLoadedState extends CarListState {
  final List<Car> listOfCars;

  const ListOfCarsLoadedState(this.listOfCars);

  @override
  List<Object?> get props => [listOfCars];
}

class ErrorLoadingListOfCarsState extends CarListState {
  final String errorMessage;

  const ErrorLoadingListOfCarsState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}