// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);
//
// import 'dart:convert';
//
// List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));
//
// String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Welcome {
//   String name;
//   ArbitrationId arbitrationId;
//   String serviceId;
//   Type type;
//   int pid;
//   int pidWidth;
//   int startBit;
//   int width;
//   double? scalar;
//   double? offset;
//   String? units;
//   List<Enum>? welcomeEnum;
//
//   Welcome({
//     required this.name,
//     required this.arbitrationId,
//     required this.serviceId,
//     required this.type,
//     required this.pid,
//     required this.pidWidth,
//     required this.startBit,
//     required this.width,
//     this.scalar,
//     this.offset,
//     this.units,
//     this.welcomeEnum,
//   });
//
//   factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//     name: json["Name"],
//     arbitrationId: ArbitrationId.fromJson(json["ArbitrationID"]),
//     serviceId: json["ServiceID"],
//     type: typeValues.map[json["Type"]]!,
//     pid: json["PID"],
//     pidWidth: json["PIDWidth"],
//     startBit: json["StartBit"],
//     width: json["Width"],
//     scalar: json["Scalar"]?.toDouble(),
//     offset: json["Offset"]?.toDouble(),
//     units: json["Units"],
//     welcomeEnum: json["Enum"] == null ? [] : List<Enum>.from(json["Enum"]!.map((x) => Enum.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Name": name,
//     "ArbitrationID": arbitrationId.toJson(),
//     "ServiceID": serviceId,
//     "Type": typeValues.reverse[type],
//     "PID": pid,
//     "PIDWidth": pidWidth,
//     "StartBit": startBit,
//     "Width": width,
//     "Scalar": scalar,
//     "Offset": offset,
//     "Units": units,
//     "Enum": welcomeEnum == null ? [] : List<dynamic>.from(welcomeEnum!.map((x) => x.toJson())),
//   };
// }
//
// class ArbitrationId {
//   String rx;
//   String tx;
//
//   ArbitrationId({
//     required this.rx,
//     required this.tx,
//   });
//
//   factory ArbitrationId.fromJson(Map<String, dynamic> json) => ArbitrationId(
//     rx: json["RX"],
//     tx: json["TX"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "RX": rx,
//     "TX": tx,
//   };
// }
//
// enum Type {
//   ENUMERATED,
//   SIGNED,
//   UNSIGNED
// }
//
// final typeValues = EnumValues({
//   "ENUMERATED": Type.ENUMERATED,
//   "SIGNED": Type.SIGNED,
//   "UNSIGNED": Type.UNSIGNED
// });
//
// class Enum {
//   String name;
//   dynamic value;
//
//   Enum({
//     required this.name,
//     required this.value,
//   });
//
//   factory Enum.fromJson(Map<String, dynamic> json) => Enum(
//     name: json["name"],
//     value: json["value"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "value": value,
//   };
// }
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
