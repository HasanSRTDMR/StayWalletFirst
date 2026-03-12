import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/app_router.dart';

class ConnectAccountScreen extends StatelessWidget {
  const ConnectAccountScreen({
    super.key,
    required this.provider,
  });

  final String provider;

  String get _title {
    switch (provider) {
      case 'booking':
        return 'Connect Booking.com';
      case 'sixt':
        return 'Connect Sixt';
      case 'uber':
        return 'Connect Uber';
      case 'allianz':
        return 'Connect Allianz';
      default:
        return 'Link Account';
    }
  }

  String get _description {
    switch (provider) {
      case 'booking':
        return 'Sync your Genius level, rewards, and upcoming stays directly to StayWallet for a seamless premium travel experience.';
      case 'sixt':
        return 'Link your Sixt account to enjoy exclusive car rental rates and seamless bookings.';
      case 'uber':
        return 'Connect Uber to track rides and expenses in one place.';
      case 'allianz':
        return 'Link Allianz for comprehensive travel insurance coverage.';
      default:
        return 'Connect your account for a seamless experience.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Link Account'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    Container(
                      width: 128,
                      height: 128,
                      decoration: BoxDecoration(
                        color: AppColors.slate800,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: AppColors.slate800),
                      ),
                      child: Icon(
                        _providerIcon,
                        size: 64,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      _title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.slate400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    _FeatureCheck(
                      title: 'Import active bookings',
                      subtitle: 'Automatically sync all your confirmed hotel reservations.',
                      value: true,
                    ),
                    const SizedBox(height: 16),
                    _FeatureCheck(
                      title: 'Sync Genius status',
                      subtitle: 'Keep your loyalty benefits and discounts active in StayWallet.',
                      value: true,
                    ),
                    const SizedBox(height: 16),
                    _FeatureCheck(
                      title: 'Expense tracking',
                      subtitle: 'Automatically log travel expenses for easy reporting.',
                      value: false,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shield, color: AppColors.slate500, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Secure 256-bit encrypted connection',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.slate500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () =>
                          context.go('${AppRoutes.linkedSuccess}/$provider'),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Connect Account'),
                          SizedBox(width: 8),
                          Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'By connecting, you agree to StayWallet\'s Terms of Service',
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.slate500,
                      letterSpacing: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData get _providerIcon {
    switch (provider) {
      case 'booking':
        return Icons.hotel;
      case 'sixt':
        return Icons.directions_car;
      case 'uber':
        return Icons.local_taxi;
      case 'allianz':
        return Icons.health_and_safety;
      default:
        return Icons.link;
    }
  }
}

class _FeatureCheck extends StatelessWidget {
  const _FeatureCheck({
    required this.title,
    required this.subtitle,
    required this.value,
  });

  final String title;
  final String subtitle;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.slate800.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.slate700),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: value,
            onChanged: (_) {},
            fillColor: WidgetStateProperty.resolveWith((states) =>
                states.contains(WidgetState.selected)
                    ? AppColors.primary
                    : null),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.slate400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
