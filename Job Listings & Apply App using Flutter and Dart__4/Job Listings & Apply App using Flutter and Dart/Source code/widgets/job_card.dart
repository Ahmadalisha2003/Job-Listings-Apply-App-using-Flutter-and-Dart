import 'package:flutter/material.dart';
import '../models/job.dart';

class JobCard extends StatelessWidget {
  final Job job;
  final VoidCallback onTap;

  const JobCard({Key? key, required this.job, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        onTap: onTap,
        title: Text(job.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${job.company} • ${job.location}'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(job.type),
            const SizedBox(height: 4),
            Text(job.postedDate, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
