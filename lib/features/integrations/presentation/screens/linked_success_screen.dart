import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/app_router.dart';

class LinkedSuccessScreen extends StatelessWidget {
  const LinkedSuccessScreen({
    super.key,
    required this.provider,
  });

  final String provider;

  String get _providerName {
    switch (provider) {
      case 'booking':
        return 'Booking.com';
      case 'sixt':
        return 'Sixt';
      case 'uber':
        return 'Uber';
      case 'allianz':
        return 'Allianz';
      default:
        return provider;
    }
  }

  String get _syncedStatus {
    switch (provider) {
      case 'booking':
        return 'Genius Level 2';
      case 'sixt':
        return 'Platinum Status';
      case 'uber':
        return 'Connected';
      case 'allianz':
        return 'Active Policy';
      default:
        return 'Connected';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 32),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 128,
                      height: 128,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.primary,
                            AppColors.primary.withOpacity(0.8),
                          ],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.4),
                            blurRadius: 24,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.check_circle,
                        color: Colors.white,
                        size: 64,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Connection Successful',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Your $_providerName account is now seamlessly integrated with StayWallet.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.slate400,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.slate800.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.slate800),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _syncedStatus,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '$_providerName Loyalty Status',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.slate400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: AppColors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.go(AppRoutes.dashboard),
                  child: const Text('Continue to Dashboard'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
