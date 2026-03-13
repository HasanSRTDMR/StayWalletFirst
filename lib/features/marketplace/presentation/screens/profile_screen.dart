import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/app_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundColor: AppColors.slate800,
                  child: Icon(Icons.person, size: 64, color: AppColors.slate400),
                ),
                const SizedBox(height: 16),
                Text(
                  'Mr. Alexander',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  'Gold Member',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.accentGold,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          _ProfileTile(
            icon: Icons.workspace_premium,
            title: 'Loyalty & Rewards',
            onTap: () => context.push(AppRoutes.loyaltyRewards),
          ),
          _ProfileTile(
            icon: Icons.credit_card,
            title: 'Smart Card Management',
            onTap: () => context.push(AppRoutes.smartCard),
          ),
          _ProfileTile(
            icon: Icons.people,
            title: 'Secondary Cardholder',
            onTap: () => context.push(AppRoutes.secondaryCardholderAppView),
          ),
          _ProfileTile(
            icon: Icons.verified_user,
            title: 'Identity Verification',
            onTap: () => context.push(AppRoutes.identityVerification),
          ),
          _ProfileTile(
            icon: Icons.notifications,
            title: 'Notifications',
            onTap: () => context.push(AppRoutes.spendingNotification),
          ),
          _ProfileTile(
            icon: Icons.account_balance_wallet,
            title: 'Trip Budgeting',
            onTap: () => context.push(AppRoutes.tripBudgeting),
          ),
          _ProfileTile(
            icon: Icons.receipt_long,
            title: 'Post Trip Expense',
            onTap: () => context.push(AppRoutes.postTripExpense),
          ),
          _ProfileTile(
            icon: Icons.local_offer,
            title: 'Merchant Offers',
            onTap: () => context.push(AppRoutes.merchantOffers),
          ),
          _ProfileTile(
            icon: Icons.hub,
            title: 'Integrated Travel Hub',
            onTap: () => context.push(AppRoutes.integratedTravelHub),
          ),
          _ProfileTile(
            icon: Icons.fact_check,
            title: 'E-Visa Services',
            onTap: () => context.push(AppRoutes.eVisa),
          ),
          _ProfileTile(
            icon: Icons.currency_exchange,
            title: 'Currency Exchange',
            onTap: () => context.push(AppRoutes.currencyExchange),
          ),
          _ProfileTile(
            icon: Icons.receipt_long,
            title: 'Checkout & Bill',
            onTap: () => context.push(AppRoutes.checkoutBill),
          ),
          const Divider(),
          _ProfileTile(
            icon: Icons.logout,
            title: 'Sign Out',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.slate800,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppColors.accentGold),
      ),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
