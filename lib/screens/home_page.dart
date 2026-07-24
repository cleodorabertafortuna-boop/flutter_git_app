import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/gradient_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Kedua')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const GradientCard(
                icon: Icons.check_circle_rounded,
                title: 'Berhasil Berpindah Halaman',
                subtitle:
                    'Kamu sekarang berada di HomePage. Tekan tombol di bawah '
                    'untuk kembali ke halaman sebelumnya.',
              ),
              const SizedBox(height: 32),
              PrimaryActionButton(
                label: 'Kembali ke Beranda',
                icon: Icons.arrow_back_rounded,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}