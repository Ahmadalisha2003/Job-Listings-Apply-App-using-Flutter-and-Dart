import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/job_provider.dart';
import '../widgets/job_card.dart';
import 'job_detail_screen.dart';

class JobListScreen extends StatelessWidget {
  const JobListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JobProvider>(context);
    final jobs = provider.jobs;

    return Scaffold(
      appBar: AppBar(title: const Text('Jobs')),
      body: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, idx) => JobCard(
          job: jobs[idx],
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => JobDetailScreen(job: jobs[idx])),
            );
          },
        ),
      ),
    );
  }
}
