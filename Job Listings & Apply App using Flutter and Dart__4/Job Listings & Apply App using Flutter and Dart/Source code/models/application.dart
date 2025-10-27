class Application {
  final String id;
  final String jobId;
  final String applicantName;
  final String email;
  final String phone;
  final String resumeText;
  final String appliedAt;

  Application({
    required this.id,
    required this.jobId,
    required this.applicantName,
    required this.email,
    required this.phone,
    required this.resumeText,
    required this.appliedAt,
  });

  factory Application.fromJson(Map<String, dynamic> json) => Application(
        id: json['id'],
        jobId: json['jobId'],
        applicantName: json['applicantName'],
        email: json['email'],
        phone: json['phone'],
        resumeText: json['resumeText'],
        appliedAt: json['appliedAt'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'jobId': jobId,
        'applicantName': applicantName,
        'email': email,
        'phone': phone,
        'resumeText': resumeText,
        'appliedAt': appliedAt,
      };
}
