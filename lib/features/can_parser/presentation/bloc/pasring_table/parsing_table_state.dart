part of 'parsing_table_bloc.dart';

abstract class ParsingTableState extends Equatable{
  const ParsingTableState();

  @override
  List<Object?> get props => [];
}

class EmptyListOfTablesState extends ParsingTableState {}

class LoadingListOfTablesState extends ParsingTableState {}

class ListOfTablesLoadedState extends ParsingTableState {
  final List<Map<String, List<ParsingTable>>> listOfParsingTables;

  const ListOfTablesLoadedState(this.listOfParsingTables);

  @override
  List<Object?> get props => [listOfParsingTables];
}

class ErrorLoadingListOfTablesState extends ParsingTableState {
  final String errorMessage;

  const ErrorLoadingListOfTablesState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}