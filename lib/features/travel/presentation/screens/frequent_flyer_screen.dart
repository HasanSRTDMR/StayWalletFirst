import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class FrequentFlyerScreen extends StatelessWidget {
  const FrequentFlyerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frequent Flyer'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.primary.withOpacity(0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.flight, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Frequent Flyer Program',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _LoyaltyTile(
                  name: 'Miles & Smiles (THY)',
                  points: '45,200 pts',
                  color: Colors.red,
                ),
                const SizedBox(height: 8),
                _LoyaltyTile(
                  name: 'Lufthansa Miles & More',
                  points: '12,850 pts',
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Add Program',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          _AddProgramTile(
            name: 'Emirates Skywards',
            icon: Icons.flight,
            onTap: () {},
          ),
          _AddProgramTile(
            name: 'Qatar Privilege Club',
            icon: Icons.flight,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _LoyaltyTile extends StatelessWidget {
  const _LoyaltyTile({
    required this.name,
    required this.points,
    required this.color,
  });

  final String name;
  final String points;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.star, size: 18, color: color),
              ),
              const SizedBox(width: 12),
              Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          Text(
            points,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _AddProgramTile extends StatelessWidget {
  const _AddProgramTile({
    required this.name,
    required this.icon,
    required this.onTap,
  });

  final String name;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(name),
      trailing: const Icon(Icons.add),
      onTap: onTap,
    );
  }
}
