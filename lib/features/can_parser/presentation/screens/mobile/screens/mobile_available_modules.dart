import 'package:can_frame_parser/features/can_parser/domain/entities/parsing_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/pasring_table/parsing_table_bloc.dart';
import '../../../widgets/mobile_home/car_modules.dart';

class MobileAvailableModules extends StatelessWidget {
  const MobileAvailableModules({super.key});

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
              "Available Modules",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            leading: IconButton(
                onPressed: (){
                  context.go("/mobile_home");
                },
                icon: const Icon(Icons.arrow_back)),
          ),

          body: Column(
            children: [
              BlocBuilder<ParsingTableBloc, ParsingTableState>(
                builder: (context, state) {
                  if (state is LoadingListOfTablesState) {
                    return const CircularProgressIndicator(
                      color: Colors.blue,
                    );
                  } else if (state is EmptyListOfTablesState) {
                    return const Center(
                      child: Text(
                          "No car data to display"
                      ),
                    );
                  } else if (state is ListOfTablesLoadedState) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: state.listOfParsingTables.length,
                          itemBuilder: (context, index){

                            Map<String, List<ParsingTable>> table = state.listOfParsingTables.elementAt(index);

                            return CarModules(
                              moduleName: table.keys.first,
                              modules: table.values.first,
                            );
                          }
                      ),
                    );
                  } else if (state is ErrorLoadingListOfTablesState) {
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
