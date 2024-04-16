import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/can_frame_bloc.dart';
import '../../bloc/can_frame_event.dart';

class CanResult extends StatelessWidget {
  final double timestamp;
  final String networkID;
  final String arbitrationID;
  final String dataFrame;

  const CanResult({
    super.key,
    required this.timestamp,
    required this.networkID,
    required this.arbitrationID,
    required this.dataFrame,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white38
              ),
              children: [
                TableCell(
                  child: Text(
                    timestamp.toString()
                  )
                ),
                TableCell(
                  child: Text(
                    networkID.toString()
                  )
                ),
                TableCell(
                  child: Text(
                    arbitrationID.toString()
                  )
                ),
                TableCell(
                  child: Text(
                    dataFrame.toString()
                  )
                ),
              ]
            )
          ],
        ),
      ),
    );
  }
}
