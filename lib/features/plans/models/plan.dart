class Plan {
  final int id;
  final String name;
  final Flight departure;
  final Flight arrival;
  final double ticketPrice;
  final Hotel hotel;
  final List<Note> notes;

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

class Flight {
  final String country;
  final String city;
  final String time;
  final String airport;

  Flight({
    required this.country,
    required this.city,
    required this.time,
    required this.airport,
  });
}

class Hotel {
  final int id;
  final String name;
  final String price;

  Hotel({
    required this.id,
    required this.name,
    required this.price,
  });
}

class Note {
  final int id;
  final String description;
  final double price;

  Note({
    required this.id,
    required this.description,
    required this.price,
  });
}
