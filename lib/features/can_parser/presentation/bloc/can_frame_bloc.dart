import 'package:bloc/bloc.dart';

import '../../domain/usecases/get_vehicle_capture_data.dart';
import 'can_frame_event.dart';
import 'can_frame_state.dart';


class CanFrameBloc extends Bloc<CanFrameEvent, CanFrameState> {

  final GetVehicleCaptureData getVehicleCaptureData;

  CanFrameBloc(
      this.getVehicleCaptureData
  ) : super(CanFrameDataEmptyState()) {
    on<OnGetVehicleCaptureEvent>(_onGetVehicleCaptureEvent);
  }

  _onGetVehicleCaptureEvent(event, emit) {
    // App loading state
    emit(LoadingCanFrameDataState());
    // Then actually get the data



  }
}
