import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/can_frames_bloc/can_frame_bloc.dart';
import '../../bloc/can_frames_bloc/can_frame_event.dart';
import '../../bloc/pasring_table/parsing_table_bloc.dart';

class CarResult extends StatelessWidget {
  final String make;
  final String model;
  final int year;
  final String transmission;

  const CarResult({
    super.key,
    required this.make,
    required this.model,
    required this.year,
    required this.transmission
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.read<ParsingTableBloc>().add(OnGetParsingTablesEvent(
          carDetails: "${make}_${model}_${year}_${transmission}"
        ));

        context.push("/mobile_home/mobile_available_modules");
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${make.toUpperCase()} ${model.toUpperCase()}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${year.toString()} (${transmission.toUpperCase()})",
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 10
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
