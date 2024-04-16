import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/can_frame_bloc.dart';
import '../../../bloc/can_frame_state.dart';
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
          backgroundColor: Colors.black,
          title: const Text(
            "Can Frames Data",
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),

        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: const [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey
                    ),
                    children: [
                      TableCell(
                        child: Text(
                          "Timestamp"
                        )
                      ),
                      TableCell(
                        child: Text(
                          "NetworkID"
                        )
                      ),
                      TableCell(
                        child: Text(
                          "Arbitration ID"
                        )
                      ),
                      TableCell(
                        child: Text(
                          "Data Frame"
                        )
                      ),
                    ]
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 20
            ),

            BlocBuilder<CanFrameBloc, CanFrameState>(
              builder: (context, state) {
                if (state is LoadingCanFrameDataState) {
                  return const CircularProgressIndicator(
                    color: Colors.blueAccent,
                  );
                } else if (state is CanFrameDataEmptyState) {
                  return const Center(
                    child: Text(
                      "No car data to display"
                    ),
                  );
                } else if (state is CanFrameDataLoadedState) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height - 200,
                    width: MediaQuery.of(context).size.width,
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
