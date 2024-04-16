import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/can_frame_bloc.dart';
import '../../../bloc/can_frame_event.dart';
import '../../../bloc/can_frame_state.dart';
import '../../../widgets/mobile_home/car_result.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({super.key});

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {

  @override
  void initState() {
    super.initState();

    // After building, call the bloc to fetch list of cars
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CanFrameBloc>().add(OnGetListOfCarsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Available Cars",
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
        body: BlocBuilder<CanFrameBloc, CanFrameState>(
          builder: (context, state) {
            if (state is LoadingListOfCarsState) {
              return const CircularProgressIndicator(
                color: Colors.blueAccent,
              );
            } else if (state is EmptyListOfCarsState) {
              return const Center(
                child: Text(
                  "No car data to display"
                ),
              );
            } else if (state is ListOfCarsLoadedState) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: state.listOfCars.length,
                  itemBuilder: (context, index){
                    return CarResult(
                      make: state.listOfCars.elementAt(index).make,
                      model: state.listOfCars.elementAt(index).model,
                      year: state.listOfCars.elementAt(index).year,
                      transmission: state.listOfCars.elementAt(index).transmission,
                    );
                  }
                ),
              );
            } else if (state is ErrorLoadingListOfCarsState) {
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
      ),
    );
  }
}
