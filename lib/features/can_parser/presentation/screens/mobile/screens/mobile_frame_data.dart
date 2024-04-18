import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/can_frames_bloc/can_frame_bloc.dart';
import '../../../bloc/can_frames_bloc/can_frame_event.dart';
import '../../../bloc/can_frames_bloc/can_frame_state.dart';
import '../../../bloc/car_list_bloc/car_list_bloc.dart';
import '../../../widgets/mobile_home/can_frame.dart';

class MobileFrameData extends StatelessWidget {
  const MobileFrameData({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: const Text(
            "Can Frames Data",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          leading: IconButton(
            onPressed: (){
              context.go("/mobile_home/mobile_available_modules");

              // After building, call the bloc to fetch list of cars
              // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              //   context.read<CarListBloc>().add(OnGetListOfCarsEvent());
              // });

            },
            icon: const Icon(Icons.arrow_back)),
        ),

        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.grey
              ),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "Timestamp"
                          ),
                        )
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "NetworkID"
                          ),
                        )
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "Arb ID"
                          ),
                        )
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "Data Frame"
                          ),
                        )
                      ),
                    ]
                  )
                ],
              ),
            ),

            BlocBuilder<CanFrameBloc, CanFrameState>(
              builder: (context, state) {
                if (state is LoadingCanFrameDataState) {
                  return const CircularProgressIndicator(
                    color: Colors.blue,
                  );
                } else if (state is CanFrameDataEmptyState) {
                  return const Center(
                    child: Text(
                      "No car data to display"
                    ),
                  );
                } else if (state is CanFrameDataLoadedState) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: state.vehicleCaptureData.length,
                        itemBuilder: (context, index){
                          return CanResult(
                            dataFrame: state.vehicleCaptureData.elementAt(index).dataFrame,
                            timestamp: state.vehicleCaptureData.elementAt(index).timestamp,
                            networkID: state.vehicleCaptureData.elementAt(index).networkID,
                            arbitrationID: state.vehicleCaptureData.elementAt(index).arbitrationID,
                          );
                        }
                    ),
                  );
                } else if (state is ErrorLoadingCanFrameDataState) {
                  return Center(
                    child: Text(
                        state.errorMessage
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        )
      ),
    );
  }
}
