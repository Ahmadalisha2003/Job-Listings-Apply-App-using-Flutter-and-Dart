import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/job.dart';
import '../providers/job_provider.dart';
import 'apply_screen.dart';

class JobDetailScreen extends StatelessWidget {
  final Job job;
  const JobDetailScreen({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JobProvider>(context);
    final apps = provider.applicationsForJob(job.id);

    return Scaffold(
      appBar: AppBar(title: Text(job.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(job.company, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(children: [Text(job.location), const SizedBox(width: 12), Text(job.type)]),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(child: Text(job.description)),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.send),
              label: const Text('Apply'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ApplyScreen(job: job)));
              },
            ),
            const SizedBox(height: 8),
            Text('Applications: ${apps.length}'),
          ],
        ),
      ),
    );
  }
}
