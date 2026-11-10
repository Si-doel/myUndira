class ServiceModel {
  final int id;
  final String title;
  final String category;
  final String description;
  final List<String> requirements;
  final List<String> procedure;
  final String contact;
  final String status;

  const ServiceModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.requirements,
    required this.procedure,
    required this.contact,
    required this.status,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] as int,
      title: json['title'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      requirements: List<String>.from(json['requirements']),
      procedure: List<String>.from(json['procedure']),
      contact: json['contact'] as String,
      status: json['status'] as String,
    );
  }
}
