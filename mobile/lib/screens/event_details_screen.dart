import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/bottom_nav.dart';

class EventDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> eventData;

  const EventDetailsScreen({super.key, required this.eventData});

  @override
  Widget build(BuildContext context) {
    final title = eventData['title'] ?? 'Event Details';

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.only(bottom: 100),
              children: [
                _buildHeader(context, title),
                const SizedBox(height: 24),
                _buildBentoGrid(context),
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

  Widget _buildHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 28),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBentoGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildBentoCard(
                  context,
                  title: 'Location',
                  subtitle: 'Main Arena, Sector 4',
                  icon: Icons.location_on,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: _buildBentoCard(
                  context,
                  title: 'Date',
                  subtitle: 'Oct 24',
                  icon: Icons.calendar_today,
                  color: AppColors.primaryAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildBentoCard(
            context,
            title: 'Schedule',
            subtitle: '18:00 - Gates Open\n20:00 - Main Act',
            icon: Icons.schedule,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildBentoCard(BuildContext context, {required String title, required String subtitle, required IconData icon, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceHighest,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 16),
          Text(title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 18)),
          const SizedBox(height: 8),
          Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
