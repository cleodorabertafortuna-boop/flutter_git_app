import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Contoh layar yang menerima data secara dinamis lewat constructor,
/// menunjukkan pola passing-data yang lazim dipakai di aplikasi nyata.
class DetailScreen extends StatelessWidget {
  final String title;
  final String description;

  const DetailScreen({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}