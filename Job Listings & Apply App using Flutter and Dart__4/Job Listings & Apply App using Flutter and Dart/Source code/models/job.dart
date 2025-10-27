class Job {
  final String id;
  final String title;
  final String company;
  final String location;
  final String type; // Full-time, Part-time, Contract...
  final String description;
  final String postedDate;

  Job({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.type,
    required this.description,
    required this.postedDate,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json['id'],
        title: json['title'],
        company: json['company'],
        location: json['location'],
        type: json['type'],
        description: json['description'],
        postedDate: json['postedDate'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'company': company,
        'location': location,
        'type': type,
        'description': description,
        'postedDate': postedDate,
      };
}
