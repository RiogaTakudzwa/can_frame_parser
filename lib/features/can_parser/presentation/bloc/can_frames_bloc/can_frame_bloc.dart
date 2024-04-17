import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/usecases/get_list_of_available_cars.dart';
import '../../../domain/usecases/get_vehicle_capture_data.dart';
import 'can_frame_event.dart';
import 'can_frame_state.dart';


class CanFrameBloc extends Bloc<CanFrameEvent, CanFrameState> {

  final GetVehicleCaptureData getVehicleCaptureData;

  CanFrameBloc(
    this.getVehicleCaptureData,
  ) : super(CanFrameDataEmptyState()) {
    on<OnGetVehicleCaptureEvent>(_onGetVehicleCaptureEvent, transformer: debounce(const Duration(milliseconds: 500)),);
  }

  _onGetVehicleCaptureEvent(event, emit) async {
    print("Getting list of frames from db");
    // App loading state
    emit(LoadingCanFrameDataState());
    // Then actually get the data specifying the car you want to get
    final result = await getVehicleCaptureData.execute(event.currentVehicleDetails);
    result.fold(
      (failure){
        emit(ErrorLoadingCanFrameDataState(failure.message));
      },
      (data){
        emit(CanFrameDataLoadedState(data));
      }
    );
  }


}

EventTransformer<T> debounce<T>(Duration duration){
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}