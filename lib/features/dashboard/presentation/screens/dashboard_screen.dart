import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../widgets/action_tile.dart';
import '../../../../widgets/transaction_tile.dart';

/// Main dashboard screen - StayWallet home
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _DashboardHeader(),
              const SizedBox(height: 24),
              _LoyaltyStatusCard(),
              const SizedBox(height: 24),
              _DigitalKeyCard(
                hotelName: 'Grand Mirage Dubai',
                roomInfo: 'Room 402 • Deluxe Suite',
                onUnlock: () => context.push(AppRoutes.digitalKeyDetails),
              ),
              const SizedBox(height: 24),
              _WalletSection(
                onManage: () => context.push(AppRoutes.wallet),
                onTopUp: () => context.push(AppRoutes.currencyExchange),
              ),
              const SizedBox(height: 24),
              _QuickActionsSection(
                onBookSpa: () {},
                onRoomService: () {},
                onViewTours: () {},
                onCheckout: () {},
              ),
              const SizedBox(height: 24),
              _RecentActivitySection(),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.accentGold, width: 2),
              color: AppColors.slate800,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back,',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Mr. Alexander',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.accentGold,
                    shape: BoxShape.circle,
                    border: Border.fromBorderSide(
                      BorderSide(color: AppColors.backgroundDark, width: 2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LoyaltyStatusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: AppTheme.goldGradientCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MEMBERSHIP TIER',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Gold Status',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black87,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ],
              ),
              Icon(
                Icons.workspace_premium,
                size: 40,
                color: Colors.black.withOpacity(0.5),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '850 / 1000 pts',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'Diamond Status',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: 0.85,
              backgroundColor: Colors.black.withOpacity(0.1),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.black54),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '150 points until your next luxury reward',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.black87,
                  fontSize: 10,
                ),
          ),
        ],
      ),
    );
  }
}

class _DigitalKeyCard extends StatelessWidget {
  final String hotelName;
  final String roomInfo;
  final VoidCallback onUnlock;

  const _DigitalKeyCard({
    required this.hotelName,
    required this.roomInfo,
    required this.onUnlock,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.slate800),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 128,
            decoration: BoxDecoration(
              color: AppColors.slate800,
              image: const DecorationImage(
                image: NetworkImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuDtMOquMZeSy5vbzeF1LyryVO1AETid7GB67wV6i8kqXSNqkAsXfsAzRKXuseCUI2zH2sK5Z6TdndvSmcPr7Mu_yrmCCpC-Ydfg30NxSSULPkq6LLfd7FAtIHwyeY0Zb-b8um-lKJSQHDRcwFMeA9U7jgXoIzOLGljO04JUSG5XViXtxdchkrIeME6I2w67STW_VKU6kut1C-eNfDLiS2sp3AFmOYlc-e8X1tlniVuJXQzC3lQfh8rJij26uUgBs6yObDaLnMQOD2UV',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        AppColors.cardDark.withOpacity(0.9),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.accentGold,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'DIGITAL KEY ACTIVE',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotelName,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        roomInfo,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.slate400,
                            ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: onUnlock,
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.4),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.lock_open,
                      color: Colors.white,
                      size: 28,
                    ),
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

class _WalletSection extends StatelessWidget {
  final VoidCallback onManage;
  final VoidCallback onTopUp;

  const _WalletSection({
    required this.onManage,
    required this.onTopUp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'StayWallet Balance',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextButton(
              onPressed: onManage,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Manage',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.accentGold,
                        ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.chevron_right, size: 16, color: AppColors.accentGold),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.slate900,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.slate800),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PRIMARY CURRENCY (AED)',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: AppColors.slate400,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '1,250.00',
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                    fontSize: 28,
                                    letterSpacing: -0.5,
                                  ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'AED',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppColors.slate500,
                                    fontSize: 18,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: onTopUp,
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Top Up'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: AppColors.slate800),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.slate800,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'USD',
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: AppColors.slate400,
                                  ),
                            ),
                            Text(
                              '\$340.50',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.slate800,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'EUR',
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: AppColors.slate400,
                                  ),
                            ),
                            Text(
                              '€312.00',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _QuickActionsSection extends StatelessWidget {
  final VoidCallback onBookSpa;
  final VoidCallback onRoomService;
  final VoidCallback onViewTours;
  final VoidCallback onCheckout;

  const _QuickActionsSection({
    required this.onBookSpa,
    required this.onRoomService,
    required this.onViewTours,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ActionTile(
            icon: Icons.spa,
            label: 'Book Spa',
            onTap: onBookSpa,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ActionTile(
            icon: Icons.restaurant,
            label: 'Room Service',
            onTap: onRoomService,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ActionTile(
            icon: Icons.explore,
            label: 'View Tours',
            onTap: onViewTours,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ActionTile(
            icon: Icons.logout,
            label: 'Check-out',
            onTap: onCheckout,
            isDanger: true,
          ),
        ),
      ],
    );
  }
}

class _RecentActivitySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Activity',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        TransactionTile(
          icon: Icons.dinner_dining,
          iconBgColor: AppColors.primary.withValues(alpha: 0.2),
          title: 'Mirage Grill & Lounge',
          amount: '- 245.00 AED',
          subtitle: 'Hotel Restaurant',
          trailingText: '15% Discount Applied',
        ),
        const SizedBox(height: 12),
        TransactionTile(
          icon: Icons.shopping_bag,
          iconBgColor: AppColors.slate800,
          title: 'Dubai Mall Merchant',
          amount: '- 89.00 AED',
          subtitle: 'External Merchant • 2 hours ago',
        ),
        const SizedBox(height: 12),
        TransactionTile(
          icon: Icons.add_circle,
          title: 'Wallet Top-up',
          amount: '+ 500.00 AED',
          subtitle: 'Visa **** 4421 • Yesterday',
          type: TransactionType.income,
        ),
      ],
    );
  }
}
