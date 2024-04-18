import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/parsing_table.dart';
import '../../../domain/usecases/get_parsing_tables.dart';

part 'parsing_table_event.dart';
part 'parsing_table_state.dart';

class ParsingTableBloc extends Bloc<ParsingTableEvent, ParsingTableState> {
  final GetListOfParsingTables getListOfParsingTables;

  ParsingTableBloc(
      this.getListOfParsingTables
  ) : super(
      EmptyListOfTablesState()
  ) {
    on<OnGetParsingTablesEvent>(_onGetParsingTables);
  }

  _onGetParsingTables(event, emit) async {
    print("Getting list of parsing tables by car details param");
    // App loading state
    emit(LoadingListOfTablesState());
    // Then actually get the data specifying the car you want to get
    final result = await getListOfParsingTables.execute(event.carDetails);
    result.fold((failure){
        emit(ErrorLoadingListOfTablesState(failure.message));
      },
          (data){
        emit(ListOfTablesLoadedState(data));
      }
    );

    print("Something wasn't returned");
  }
}
