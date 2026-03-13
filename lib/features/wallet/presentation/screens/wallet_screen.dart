import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/models/transaction_model.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/services/wallet_service.dart';
import '../../../../widgets/transaction_tile.dart';

/// Wallet overview screen
class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final _walletService = WalletService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: Future.wait([
            _walletService.getWallet(),
            _walletService.getTransactions(),
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
                      'Error loading wallet data',
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
            final wallet = results[0] as dynamic;
            final transactions = results[1] as List<dynamic>;

            return RefreshIndicator(
              onRefresh: () async {
                setState(() {});
              },
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
                    _buildBalanceCard(context, wallet),
                    const SizedBox(height: 24),
                    _buildQuickActions(context),
                    const SizedBox(height: 24),
                    Text(
                      'Recent Transactions',
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
                    const SizedBox(height: 24),
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
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: AppColors.slate800,
                        child: const Icon(Icons.map, color: AppColors.slate400),
                      ),
                      title: const Text('Trip Itinerary'),
                      subtitle: const Text('View your trip schedule'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.push(AppRoutes.tripItinerary),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: AppColors.slate800,
                        child: const Icon(Icons.workspace_premium, color: AppColors.slate400),
                      ),
                      title: const Text('Loyalty & Rewards'),
                      subtitle: const Text('Points and rewards'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.push(AppRoutes.loyaltyRewards),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

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

  String _formatCurrency(double amount) {
    return amount.toStringAsFixed(2).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }

  Widget _buildBalanceCard(BuildContext context, dynamic wallet) {
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
            '${_formatCurrency(wallet.primaryBalance)} ${wallet.primaryCurrency}',
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
                  onPressed: () => _showSendMoneyDialog(context),
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
            onTap: () {
              // Show transaction history (already visible below)
              // Could scroll to transactions section
            },
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

// Helper function for send money
void _showSendMoneyDialog(BuildContext context) {
  final amountController = TextEditingController();
  final recipientController = TextEditingController();
  String selectedCurrency = 'AED';

  showDialog(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        backgroundColor: AppColors.cardDark,
        title: const Text('Send Money'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: recipientController,
              decoration: const InputDecoration(
                labelText: 'Recipient',
                hintText: 'Enter phone number or email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                DropdownButton<String>(
                  value: selectedCurrency,
                  items: ['AED', 'USD', 'EUR'].map((currency) {
                    return DropdownMenuItem(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCurrency = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Available balance: 1,250.00 AED',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.slate400,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (amountController.text.isNotEmpty &&
                  recipientController.text.isNotEmpty) {
                Navigator.of(context, rootNavigator: true).pop();
                Future.delayed(const Duration(milliseconds: 100), () {
                  if (context.mounted) {
                    _showSendConfirmation(
                      context,
                      amountController.text,
                      selectedCurrency,
                      recipientController.text,
                    );
                  }
                });
              }
            },
            child: const Text('Send'),
          ),
        ],
      ),
    ),
  );
}

void _showSendConfirmation(
  BuildContext context,
  String amount,
  String currency,
  String recipient,
) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: AppColors.cardDark,
      title: Row(
        children: [
          Icon(Icons.check_circle, color: AppColors.green, size: 28),
          const SizedBox(width: 12),
          const Expanded(child: Text('Money Sent')),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Amount: $amount $currency'),
          const SizedBox(height: 8),
          Text('Recipient: $recipient'),
          const SizedBox(height: 16),
          const Text(
            'Transaction completed successfully!',
            style: TextStyle(fontSize: 12, color: AppColors.slate400),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
