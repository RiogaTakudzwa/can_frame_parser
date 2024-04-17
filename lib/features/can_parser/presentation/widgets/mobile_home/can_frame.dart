import 'package:flutter/material.dart';

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
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        // color: Colors.red,
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
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    timestamp.toString()
                  ),
                )
              ),
              TableCell(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    networkID.toString()
                  ),
                )
              ),
              TableCell(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    arbitrationID.toString()
                  ),
                )
              ),
              TableCell(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    dataFrame.toString()
                  ),
                )
              ),
            ]
          )
        ],
      ),
    );
  }
}
