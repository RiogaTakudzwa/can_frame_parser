import 'package:can_frame_parser/features/can_parser/domain/entities/car.dart';

class CarModel extends Car{

  const CarModel({
    required String make,
    required String model,
    required int year,
    required String transmission,
  }) : super(
    make: make,
    model: model,
    year: year,
    transmission: transmission
  );

  factory CarModel.fromJson(Map<String, dynamic> json){
    return CarModel(
      make: json["make"] ?? "No Make",
      model: json["model"] ?? "No Model",
      year: json["year"] ?? "No Year",
      transmission: json["transmission"] ?? "No Transmission",
    );
  }

  Car toEntity() => Car(
    make: make,
    model: model,
    year: year,
    transmission: transmission
  );

}