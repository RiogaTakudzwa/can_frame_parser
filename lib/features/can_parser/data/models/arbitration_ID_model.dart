import 'package:can_frame_parser/features/can_parser/domain/entities/arbitration_ID.dart';

class ArbitrationIDModel extends ArbitrationID{

  const ArbitrationIDModel({
    required String rx,
    required String tx,
  }) : super (
    rx: rx,
    tx: tx
  );

  factory ArbitrationIDModel.fromJson(Map<String, dynamic> json) => ArbitrationIDModel(
    rx: json["RX"],
    tx: json["TX"],
  );

  Map<String, dynamic> toJson() => {
    "RX": rx,
    "TX": tx,
  };

  ArbitrationID toEntity() => ArbitrationID(
    rx: rx,
    tx: tx
  );
}