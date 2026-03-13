import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/app_router.dart';
import '../../../../widgets/sliver_app_bar_header.dart';

class DigitalKeyDetailsScreen extends StatelessWidget {
  const DigitalKeyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBarHeader(
            title: 'Digital Key',
            onBack: null,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Hotel avatar
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.accentGold.withOpacity(0.5)),
                    ),
                    child: ClipOval(
                      child: Container(
                        color: AppColors.slate800,
                        child: Icon(Icons.hotel, size: 48, color: AppColors.slate400),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Grand Mirage Dubai',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Room 402 - Deluxe Suite',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.slate400,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: AppColors.primary.withOpacity(0.2)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.workspace_premium, size: 16, color: AppColors.primary),
                        const SizedBox(width: 8),
                        Text(
                          'StayWallet Premium',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),
                  // Hold to unlock button
                  GestureDetector(
                    onTap: () => _unlockRoom(context),
                    child: Container(
                      width: 208,
                      height: 208,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [AppColors.primary, Color(0xFF0A3A8F)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.4),
                            blurRadius: 50,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.nfc, size: 64, color: Colors.white),
                          SizedBox(height: 8),
                          Text(
                            'Hold to Unlock',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Hold your phone near the door lock',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 48),
                  OutlinedButton.icon(
                    onPressed: () => context.go(AppRoutes.identityVerification),
                    icon: const Icon(Icons.key),
                    label: const Text('Activate Digital Key'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Helper function for unlocking room
void _unlockRoom(BuildContext context) {
  if (!context.mounted) return;
  
  // Show loading dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (loadingDialogContext) => AlertDialog(
      backgroundColor: AppColors.cardDark,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          const Text('Unlocking room...'),
        ],
      ),
    ),
  );

  // Simulate unlock process
  Future.delayed(const Duration(seconds: 2), () {
    if (!context.mounted) return;
    
    // Close loading dialog first
    Navigator.of(context, rootNavigator: true).pop();
    
    // Small delay before showing success dialog
    Future.delayed(const Duration(milliseconds: 100), () {
      if (!context.mounted) return;
      
      // Show success dialog
      showDialog(
        context: context,
        builder: (successDialogContext) => AlertDialog(
          backgroundColor: AppColors.cardDark,
          title: Row(
            children: [
              Icon(Icons.lock_open, color: AppColors.green, size: 28),
              const SizedBox(width: 12),
              const Expanded(child: Text('Room Unlocked')),
            ],
          ),
          content: const Text('Room 402 has been unlocked successfully!'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(successDialogContext, rootNavigator: true).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    });
  });
}
