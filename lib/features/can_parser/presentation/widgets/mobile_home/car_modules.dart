import 'package:flutter/material.dart';

import '../../../domain/entities/parsing_table.dart';

class CarModules extends StatelessWidget {
  final String moduleName;
  final List<ParsingTable> modules;

  const CarModules({
    super.key,
    required this.moduleName,
    required this.modules,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // Function that takes the full list of can frames
        // then filters and translates them by module selected

        // Not navigating yet
        // context.push("/mobile_home/mobile_frame_data");
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
                  moduleName.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
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
