part of 'car_list_bloc.dart';

abstract class CarListEvent extends Equatable{
  const CarListEvent();

  @override
  List<Object?> get props => [];
}

class OnGetListOfCarsEvent extends CarListEvent {}