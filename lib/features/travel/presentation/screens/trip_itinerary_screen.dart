import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class TripItineraryScreen extends StatelessWidget {
  const TripItineraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Itinerary'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _ItineraryCard(
            date: 'Mar 15, 2025',
            title: 'Dubai International Airport',
            subtitle: 'Arrival • Flight EK 123',
            icon: Icons.flight_land,
          ),
          const SizedBox(height: 12),
          _ItineraryCard(
            date: 'Mar 15 - 18, 2025',
            title: 'Grand Mirage Dubai',
            subtitle: 'Room 402 • Deluxe Suite',
            icon: Icons.hotel,
          ),
          const SizedBox(height: 12),
          _ItineraryCard(
            date: 'Mar 18, 2025',
            title: 'Dubai International Airport',
            subtitle: 'Departure • Flight EK 124',
            icon: Icons.flight_takeoff,
          ),
        ],
      ),
    );
  }
}

class _ItineraryCard extends StatelessWidget {
  const _ItineraryCard({
    required this.date,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String date;
  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.slate800),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.slate400,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.slate500,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.slate400),
        ],
      ),
    );
  }
}
