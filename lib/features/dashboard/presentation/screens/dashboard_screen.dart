import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/models/transaction_model.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/services/dashboard_service.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../widgets/action_tile.dart';
import '../../../../widgets/transaction_tile.dart';

/// Main dashboard screen - StayWallet home
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _dashboardService = DashboardService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: Future.wait([
            _dashboardService.getUser(),
            _dashboardService.getWallet(),
            _dashboardService.getLoyaltyStatus(),
            _dashboardService.getDigitalKey(),
            _dashboardService.getRecentTransactions(),
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 48, color: AppColors.slate400),
                    const SizedBox(height: 16),
                    Text(
                      'Error loading data',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      snapshot.error.toString(),
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }

            final results = snapshot.data!;
            final user = results[0] as dynamic;
            final wallet = results[1] as dynamic;
            final loyaltyStatus = results[2] as dynamic;
            final digitalKey = results[3] as dynamic;
            final transactions = results[4] as List<dynamic>;

            return RefreshIndicator(
              onRefresh: () async {
                setState(() {});
              },
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _DashboardHeader(user: user),
                    const SizedBox(height: 24),
                    _LoyaltyStatusCard(loyaltyStatus: loyaltyStatus),
                    const SizedBox(height: 24),
                    _DigitalKeyCard(
                      digitalKey: digitalKey,
                      onUnlock: () => context.push(AppRoutes.digitalKeyDetails),
                    ),
                    const SizedBox(height: 24),
                    _WalletSection(
                      wallet: wallet,
                      onManage: () => context.push(AppRoutes.wallet),
                      onTopUp: () => context.push(AppRoutes.currencyExchange),
                    ),
                    const SizedBox(height: 24),
                    _QuickActionsSection(
                      onBookSpa: () {},
                      onRoomService: () => context.push(AppRoutes.orderingRoomServiceVoice),
                      onViewTours: () {},
                      onCheckout: () {},
                    ),
                    const SizedBox(height: 24),
                    _RecentActivitySection(transactions: transactions),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  final dynamic user;

  const _DashboardHeader({required this.user});

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
                  user.fullName,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.mic),
                onPressed: () => context.push(AppRoutes.aiVoiceAssistant),
                tooltip: 'AI Voice Assistant',
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
        ],
      ),
    );
  }
}

class _LoyaltyStatusCard extends StatelessWidget {
  final dynamic loyaltyStatus;

  const _LoyaltyStatusCard({required this.loyaltyStatus});

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
                    loyaltyStatus.tier,
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
                '${loyaltyStatus.currentPoints} / ${loyaltyStatus.nextTierPoints} pts',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                loyaltyStatus.nextTier,
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
              value: loyaltyStatus.progress.clamp(0.0, 1.0),
              backgroundColor: Colors.black.withOpacity(0.1),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.black54),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            loyaltyStatus.message,
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
  final dynamic digitalKey;
  final VoidCallback onUnlock;

  const _DigitalKeyCard({
    required this.digitalKey,
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
              image: digitalKey.imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(digitalKey.imageUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
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
                        digitalKey.hotelName,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        digitalKey.roomInfo,
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
  final dynamic wallet;
  final VoidCallback onManage;
  final VoidCallback onTopUp;

  const _WalletSection({
    required this.wallet,
    required this.onManage,
    required this.onTopUp,
  });

  String _formatCurrency(double amount) {
    return amount.toStringAsFixed(2).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }

  @override
  Widget build(BuildContext context) {
    final usdBalance = wallet.otherBalances['USD'] ?? 0.0;
    final eurBalance = wallet.otherBalances['EUR'] ?? 0.0;

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
                          'PRIMARY CURRENCY (${wallet.primaryCurrency})',
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
                              _formatCurrency(wallet.primaryBalance),
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                    fontSize: 28,
                                    letterSpacing: -0.5,
                                  ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              wallet.primaryCurrency,
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
              if (wallet.otherBalances.isNotEmpty) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: AppColors.slate800),
                    ),
                  ),
                  child: Builder(
                    builder: (context) {
                      final entries = wallet.otherBalances.entries.take(2).toList();
                      return Row(
                        children: [
                          for (int i = 0; i < entries.length; i++)
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: i < entries.length - 1 ? 8 : 0),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: AppColors.slate800,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      entries[i].key,
                                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                            color: AppColors.slate400,
                                          ),
                                    ),
                                    Text(
                                      entries[i].key == 'USD'
                                          ? '\$${_formatCurrency(entries[i].value)}'
                                          : entries[i].key == 'EUR'
                                              ? '€${_formatCurrency(entries[i].value)}'
                                              : '${_formatCurrency(entries[i].value)} ${entries[i].key}',
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ],
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
  final List<dynamic> transactions;

  const _RecentActivitySection({required this.transactions});

  IconData _getIconFromName(String iconName) {
    switch (iconName) {
      case 'dinner_dining':
        return Icons.dinner_dining;
      case 'shopping_bag':
        return Icons.shopping_bag;
      case 'add_circle':
        return Icons.add_circle;
      case 'spa':
        return Icons.spa;
      case 'currency_exchange':
        return Icons.currency_exchange;
      default:
        return Icons.receipt;
    }
  }

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
        ...transactions.map((txn) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: TransactionTile(
                icon: _getIconFromName(txn.iconName),
                iconBgColor: txn.type == TransactionType.income
                    ? AppColors.green.withValues(alpha: 0.2)
                    : AppColors.primary.withValues(alpha: 0.2),
                title: txn.title,
                amount: txn.amount,
                subtitle: txn.subtitle,
                trailingText: txn.trailingText,
                type: txn.type,
              ),
            )),
      ],
    );
  }
}
