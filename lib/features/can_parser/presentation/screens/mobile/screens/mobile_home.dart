import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/can_frame_bloc.dart';
import '../../../bloc/can_frame_state.dart';

class MobileHome extends StatelessWidget {
  const MobileHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Can Frames",
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
        body: BlocBuilder<CanFrameBloc, CanFrameState>(
          builder: (context, state) {
            switch (state.runtimeType) {

              case LoadingCanFrameDataState _:
                return const CircularProgressIndicator(
                  color: Colors.red,
                );

              case CanFrameDataEmptyState _:
                return const Center(
                  child: Text(
                    "No Can frame data to display"
                  ),
                );

              case CanFrameDataLoadedState _:
                return const Center(
                  child: Text(
                      "No Can frame data to display"
                  ),
                );

                case ErrorLoadingCanFrameDataState _:
                return const Center(
                  child: Text(
                      "No Can frame data to display"
                  ),
                );

              default:
              // probably throw
                return const SizedBox();
            }

          },
        ),
      ),
    );
  }
}
