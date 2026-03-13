import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/models/transaction_model.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.title,
    required this.amount,
    required this.subtitle,
    required this.icon,
    this.trailingText,
    this.badge,
    this.timeAgo,
    this.type = TransactionType.expense,
    this.iconBgColor,
    this.iconColor,
    this.amountColor,
  });

  final String title;
  final String amount;
  final String subtitle;
  final IconData icon;
  final String? trailingText;
  final String? badge;
  final String? timeAgo;
  final TransactionType type;
  final Color? iconBgColor;
  final Color? iconColor;
  final Color? amountColor;

  @override
  Widget build(BuildContext context) {
    final resolvedAmountColor = amountColor ??
        (type == TransactionType.income ? AppColors.green : AppColors.slate100);
    final resolvedBgColor = iconBgColor ??
        (type == TransactionType.income
            ? AppColors.green.withValues(alpha: 0.2)
            : AppColors.primary.withValues(alpha: 0.2));
    final resolvedIconColor = iconColor ??
        (type == TransactionType.income ? AppColors.green : AppColors.primary);
    final displayBadge = badge ?? trailingText;
    final displayTime = timeAgo ?? (trailingText != null && badge == null ? trailingText : null);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.slate800),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: resolvedBgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: resolvedIconColor, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.slate100,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      amount,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: resolvedAmountColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.slate500,
                        ),
                      ),
                    ),
                    if (displayBadge != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.accentGold.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          displayBadge!,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: AppColors.accentGold,
                          ),
                        ),
                      )
                    else if (displayTime != null)
                      Text(
                        displayTime!,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.slate400,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
