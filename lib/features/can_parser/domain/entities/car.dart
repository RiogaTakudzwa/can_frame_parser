import 'package:equatable/equatable.dart';

class Car extends Equatable{
  final String make;
  final String model;
  final int year;
  final String transmission;

  const Car({
    required this.make,
    required this.model,
    required this.year,
    required this.transmission,
  });

  @override
  List<Object?> get props => [
    make,
    model,
    year,
    transmission,
  ];

}