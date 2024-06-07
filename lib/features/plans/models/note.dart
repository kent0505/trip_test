import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 3)
class Note extends HiveObject {
  @HiveField(0)
  final String description;

  @HiveField(1)
  final double price;

  Note({
    required this.description,
    required this.price,
  });
}

class NoteAdapter extends TypeAdapter<Note> {
  @override
  final typeId = 3;

  @override
  Note read(BinaryReader reader) {
    return Note(
      description: reader.read(),
      price: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Note obj) {
    writer.write(obj.description);
    writer.write(obj.price);
  }
}
