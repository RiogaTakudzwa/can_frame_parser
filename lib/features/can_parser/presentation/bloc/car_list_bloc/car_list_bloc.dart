import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/car.dart';
import '../../../domain/usecases/get_list_of_available_cars.dart';

part 'car_list_event.dart';
part 'car_list_state.dart';

class CarListBloc extends Bloc<CarListEvent, CarListState> {

  final GetListOfAvailableCars getListOfAvailableCars;

  CarListBloc(
      this.getListOfAvailableCars
  ) : super(EmptyListOfCarsState()) {
    on<CarListEvent>(_onGetListOfCarsEvent);
  }

  _onGetListOfCarsEvent(event, emit) async {
    print("Getting list of cars from db");
    // App loading state
    emit(LoadingListOfCarsState());
    // Then actually get the data specifying the car you want to get
    final result = await getListOfAvailableCars.execute();
    result.fold(
            (failure){
          emit(ErrorLoadingListOfCarsState(failure.message));
        },
            (data){
          emit(ListOfCarsLoadedState(data));
        }
    );
  }
}
