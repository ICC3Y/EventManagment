import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/bottom_nav.dart';
import '../services/websocket_service.dart';

class VenueMapScreen extends StatefulWidget {
  const VenueMapScreen({super.key});

  @override
  State<VenueMapScreen> createState() => _VenueMapScreenState();
}

class _VenueMapScreenState extends State<VenueMapScreen> {
  final WebSocketService _wsService = WebSocketService();

  @override
  void dispose() {
    // Only dispose the service if you aren't using a global singleton pattern
    _wsService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                Expanded(
                  child: _buildInteractiveMap(),
                ),
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

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        'Live Venue Map',
        style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 28),
      ),
    );
  }

  Widget _buildInteractiveMap() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: AppColors.surfaceHighest,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
      ),
      child: Stack(
        children: [
          Center(
            child: Icon(
              Icons.map,
              size: 100,
              color: AppColors.textSecondary.withValues(alpha: 0.2),
            ),
          ),
          _buildLiveTelemetryStream(),
        ],
      ),
    );
  }

  Widget _buildLiveTelemetryStream() {
    return StreamBuilder<dynamic>(
      stream: _wsService.gatesStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: Text('Connecting to telemetry...', style: TextStyle(color: AppColors.textSecondary)),
          );
        }

        final data = snapshot.data as Map<String, dynamic>;
        final String gateName = data['name'] ?? 'Unknown Gate';
        final int throughput = data['throughput_per_minute'] ?? 0;

        return Positioned(
          top: 20,
          left: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.sensors, color: AppColors.primary, size: 16),
                const SizedBox(width: 8),
                Text(
                  '$gateName: $throughput/min',
                  style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
