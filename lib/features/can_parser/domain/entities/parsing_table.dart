import 'package:equatable/equatable.dart';
import 'arbitration_ID.dart';

class ParsingTable extends Equatable{
  final String name;
  final ArbitrationID arbitrationId;
  final String serviceId;
  final Type type;
  final int pid;
  final int pidWidth;
  final int startBit;
  final int width;
  final double? scalar;
  final double? offset;
  final String? units;
  final List<Enum>? parsingTableEnum;

  const ParsingTable({
    required this.name,
    required this.arbitrationId,
    required this.serviceId,
    required this.type,
    required this.pid,
    required this.pidWidth,
    required this.startBit,
    required this.width,
    this.scalar,
    this.offset,
    this.units,
    this.parsingTableEnum,
  });

  @override
  List<Object?> get props => [
    name,
    arbitrationId,
    serviceId,
    type,
    pid,
    pidWidth,
    startBit,
    width,
    scalar,
    offset,
    units,
    parsingTableEnum,
  ];
}

enum Type {
  ENUMERATED,
  SIGNED,
  UNSIGNED
}

final typeValues = EnumValues({
  "ENUMERATED": Type.ENUMERATED,
  "SIGNED": Type.SIGNED,
  "UNSIGNED": Type.UNSIGNED
});

class Enum {
  String name;
  dynamic value;

  Enum({
    required this.name,
    required this.value,
  });

  factory Enum.fromJson(Map<String, dynamic> json) => Enum(
    name: json["name"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "value": value,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
