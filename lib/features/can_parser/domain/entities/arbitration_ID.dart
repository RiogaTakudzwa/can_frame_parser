import 'package:equatable/equatable.dart';

class ArbitrationID extends Equatable {
  final String rx;
  final String tx;

  const ArbitrationID({
    required this.rx,
    required this.tx,
  });

  @override
  List<Object?> get props => [rx, tx];
}
