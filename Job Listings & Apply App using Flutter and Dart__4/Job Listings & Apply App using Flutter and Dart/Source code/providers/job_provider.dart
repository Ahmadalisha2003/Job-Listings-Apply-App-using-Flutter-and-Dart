import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/job.dart';
import '../models/application.dart';
import '../services/local_storage.dart';

class JobProvider with ChangeNotifier {
  final List<Job> _jobs = [];
  final List<Application> _applications = [];

  JobProvider() {
    _seedJobs();
    _loadApplications();
  }

  List<Job> get jobs => List.unmodifiable(_jobs);
  List<Application> get applications => List.unmodifiable(_applications);

  void _seedJobs() {
    // Add a few sample jobs
    _jobs.addAll([
      Job(
        id: 'job1',
        title: 'Flutter Developer',
        company: 'Acme Apps',
        location: 'Remote',
        type: 'Full-time',
        description:
            'We are looking for a Flutter developer to build cross-platform mobile apps.',
        postedDate: '2025-10-01',
      ),
      Job(
        id: 'job2',
        title: 'Backend Engineer (Dart/Go)',
        company: 'Skyline Tech',
        location: 'Hyderabad, India',
        type: 'Full-time',
        description:
            'Work on robust APIs, microservices and cloud infrastructure.',
        postedDate: '2025-09-28',
      ),
      Job(
        id: 'job3',
        title: 'UI/UX Designer',
        company: 'Design Studio',
        location: 'Bangalore, India',
        type: 'Contract',
        description:
            'Design beautiful mobile and web interfaces with Figma expertise.',
        postedDate: '2025-09-20',
      ),
    ]);
  }

  Future<void> _loadApplications() async {
    final apps = await LocalStorage.loadApplications();
    _applications.addAll(apps);
    notifyListeners();
  }

  Future<void> applyToJob({
    required String jobId,
    required String applicantName,
    required String email,
    required String phone,
    required String resumeText,
  }) async {
    final id = const Uuid().v4();
    final app = Application(
      id: id,
      jobId: jobId,
      applicantName: applicantName,
      email: email,
      phone: phone,
      resumeText: resumeText,
      appliedAt: DateTime.now().toIso8601String(),
    );
    _applications.add(app);
    await LocalStorage.saveApplications(_applications);
    notifyListeners();
  }

  List<Application> applicationsForJob(String jobId) =>
      _applications.where((a) => a.jobId == jobId).toList();
}
