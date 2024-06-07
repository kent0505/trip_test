import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class Flight extends HiveObject {
  @HiveField(0)
  final String country;
  @HiveField(1)
  final String city;
  @HiveField(2)
  final String time;
  @HiveField(3)
  final String airport;

  Flight({
    required this.country,
    required this.city,
    required this.time,
    required this.airport,
  });
}

class FlightAdapter extends TypeAdapter<Flight> {
  @override
  final typeId = 1;

  @override
  Flight read(BinaryReader reader) {
    return Flight(
      country: reader.read(),
      city: reader.read(),
      time: reader.read(),
      airport: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Flight obj) {
    writer.write(obj.country);
    writer.write(obj.city);
    writer.write(obj.time);
    writer.write(obj.airport);
  }
}
