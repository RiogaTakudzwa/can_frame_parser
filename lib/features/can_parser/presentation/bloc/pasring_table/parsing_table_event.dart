part of 'parsing_table_bloc.dart';

abstract class ParsingTableEvent extends Equatable{
  const ParsingTableEvent();

  @override
  List<Object?> get props => [];
}

class OnGetParsingTablesEvent extends ParsingTableEvent{
  final String carDetails;

  const OnGetParsingTablesEvent({required this.carDetails});
}