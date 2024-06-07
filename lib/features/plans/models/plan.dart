import 'package:hive_flutter/hive_flutter.dart';

import 'flight.dart';
import 'hotel.dart';

@HiveType(typeId: 0)
class Plan extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final Flight departure;

  @HiveField(3)
  final Flight arrival;

  @HiveField(4)
  final double ticketPrice;

  @HiveField(5)
  final Hotel hotel;

  @HiveField(6)
  final List notes;

  Plan({
    required this.id,
    required this.name,
    required this.departure,
    required this.arrival,
    required this.ticketPrice,
    required this.hotel,
    required this.notes,
  });
}

class PlanAdapter extends TypeAdapter<Plan> {
  @override
  final typeId = 0;

  @override
  Plan read(BinaryReader reader) {
    return Plan(
      id: reader.read(),
      name: reader.read(),
      departure: reader.read(),
      arrival: reader.read(),
      ticketPrice: reader.read(),
      hotel: reader.read(),
      notes: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Plan obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.departure);
    writer.write(obj.arrival);
    writer.write(obj.ticketPrice);
    writer.write(obj.hotel);
    writer.write(obj.notes);
  }
}
