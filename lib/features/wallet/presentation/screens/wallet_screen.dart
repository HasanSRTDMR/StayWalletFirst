import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/app_router.dart';

/// Wallet overview screen
class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'StayWallet',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
              ),
              const SizedBox(height: 24),
              _buildBalanceCard(context),
              const SizedBox(height: 24),
              _buildQuickActions(context),
              const SizedBox(height: 24),
              Text(
                'Recent Transactions',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundColor: AppColors.primary.withOpacity(0.2),
                  child: const Icon(Icons.currency_exchange, color: AppColors.primary),
                ),
                title: const Text('Currency Exchange'),
                subtitle: const Text('AED ↔ USD'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push(AppRoutes.currencyExchange),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundColor: AppColors.slate800,
                  child: const Icon(Icons.credit_card, color: AppColors.slate400),
                ),
                title: const Text('Smart Card'),
                subtitle: const Text('Manage cards'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push(AppRoutes.smartCard),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundColor: AppColors.primary.withOpacity(0.2),
                  child: const Icon(Icons.notifications, color: AppColors.primary),
                ),
                title: const Text('Spending Alerts'),
                subtitle: const Text('Configure notifications'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push(AppRoutes.spendingNotification),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.slate800),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TOTAL BALANCE',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.slate400,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            '1,250.00 AED',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => context.push(AppRoutes.currencyExchange),
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Top Up'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.send, size: 18),
                  label: const Text('Send'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: const BorderSide(color: AppColors.primary),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _QuickActionTile(
            icon: Icons.currency_exchange,
            label: 'Exchange',
            onTap: () => context.push(AppRoutes.currencyExchange),
          ),
        ),
        Expanded(
          child: _QuickActionTile(
            icon: Icons.credit_card,
            label: 'Cards',
            onTap: () => context.push(AppRoutes.smartCard),
          ),
        ),
        Expanded(
          child: _QuickActionTile(
            icon: Icons.history,
            label: 'History',
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

class _QuickActionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.slate800.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withOpacity(0.05)),
              ),
              child: Icon(icon, color: AppColors.accentGold),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
