import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/event_card.dart';
import '../widgets/bottom_nav.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.only(bottom: 100),
              children: [
                _buildHeader(),
                const SizedBox(height: 24),
                _buildSectionTitle('Current Events'),
                const SizedBox(height: 16),
                _buildEventList(true),
                const SizedBox(height: 32),
                _buildSectionTitle('Upcoming Events'),
                const SizedBox(height: 16),
                _buildEventList(false),
              ],
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GlassBottomNav(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        'My Events',
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Widget _buildEventList(bool isCurrent) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          EventCard(
            title: isCurrent ? 'Neon Festival 2026' : 'Acoustic Nights',
            subtitle: isCurrent ? 'Live now - Gate B is active' : 'Next Week',
            isActive: isCurrent,
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: {'id': 1, 'title': isCurrent ? 'Neon Festival 2026' : 'Acoustic Nights'});
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
