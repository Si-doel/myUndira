class EventModel {
  final int id;
  final String title;
  final String category;
  final String description;
  final String date;
  final String time;
  final String location;
  final String image;
  final String organizer;
  final String status;

  const EventModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.image,
    required this.organizer,
    required this.status,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] as int,
      title: json['title'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      location: json['location'] as String,
      image: json['image'] as String,
      organizer: json['organizer'] as String,
      status: json['status'] as String,
    );
  }
}
