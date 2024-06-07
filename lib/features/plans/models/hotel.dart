import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 2)
class Hotel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  double price;

  Hotel({
    required this.name,
    required this.price,
  });
}

class HotelAdapter extends TypeAdapter<Hotel> {
  @override
  final typeId = 2;

  @override
  Hotel read(BinaryReader reader) {
    return Hotel(
      name: reader.read(),
      price: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Hotel obj) {
    writer.write(obj.name);
    writer.write(obj.price);
  }
}
