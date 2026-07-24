import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/gradient_card.dart';
import 'home_page.dart';
import 'detail_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Beranda')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Animasi fade + slide saat layar pertama kali muncul
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 20 * (1 - value)),
                      child: child,
                    ),
                  );
                },
                child: const Text(
                  'Selamat Datang 👋',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Aplikasi navigasi Flutter dengan tampilan modern, '
                'transisi halus, dan struktur kode yang rapi.',
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 15),
              ),
              const SizedBox(height: 28),

              const GradientCard(
                icon: Icons.rocket_launch_rounded,
                title: 'Mulai Eksplorasi',
                subtitle:
                    'Lihat contoh navigasi antar halaman dengan animasi '
                    'transisi kustom di aplikasi ini.',
              ),
              const SizedBox(height: 32),

              Text(
                'Menu Navigasi',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 18,
                    ),
              ),
              const SizedBox(height: 16),

              _MenuTile(
                icon: Icons.home_rounded,
                title: 'Halaman Kedua',
                subtitle: 'Contoh navigasi dasar dengan transisi slide',
                onTap: () {
                  Navigator.push(
                    context,
                    _buildRoute(const HomePage()),
                  );
                },
              ),
              const SizedBox(height: 12),
              _MenuTile(
                icon: Icons.info_outline_rounded,
                title: 'Halaman Detail',
                subtitle: 'Contoh mengirim data antar halaman',
                onTap: () {
                  Navigator.push(
                    context,
                    _buildRoute(
                      const DetailScreen(
                        title: 'Detail Item',
                        description:
                            'Ini adalah data yang dikirim dari FirstScreen '
                            'menuju DetailScreen menggunakan constructor.',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Transisi kustom (slide dari kanan) agar terasa lebih profesional
  /// dibanding transisi default.
  static Route _buildRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end)
            .chain(CurveTween(curve: Curves.easeInOutCubic));
        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _MenuTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.surfaceColor,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black.withValues(alpha: 0.06)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppTheme.primaryColor),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded,
                  color: AppTheme.textSecondary),
            ],
          ),
        ),
      ),
    );
  }
}