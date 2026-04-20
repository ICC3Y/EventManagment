import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class GlassBottomNav extends StatelessWidget {
  const GlassBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: Container(
          height: 80,
          color: AppColors.surfaceHighest.withValues(alpha: 0.6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.dashboard, color: AppColors.primary),
                onPressed: () => Navigator.pushReplacementNamed(context, '/'),
              ),
              IconButton(
                icon: const Icon(Icons.map, color: AppColors.textSecondary),
                onPressed: () => Navigator.pushReplacementNamed(context, '/map'),
              ),
              IconButton(
                icon: const Icon(Icons.person, color: AppColors.textSecondary),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
