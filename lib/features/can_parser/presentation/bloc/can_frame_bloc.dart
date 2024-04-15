import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/usecases/get_vehicle_capture_data.dart';
import 'can_frame_event.dart';
import 'can_frame_state.dart';


class CanFrameBloc extends Bloc<CanFrameEvent, CanFrameState> {

  final GetVehicleCaptureData getVehicleCaptureData;

  CanFrameBloc(
      this.getVehicleCaptureData,
  ) : super(CanFrameDataEmptyState()) {
    on<OnGetVehicleCaptureEvent>(_onGetVehicleCaptureEvent);
  }

  _onGetVehicleCaptureEvent(event, emit) async {
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

  _onFilterByArbitrationID(event, emit){

    // look up transformers
    transformer: debounce(const Duration(milliseconds: 500));
  }
}

EventTransformer<T> debounce<T>(Duration duration){
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}