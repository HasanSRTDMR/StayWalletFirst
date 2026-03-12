import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

/// Quick action tile for dashboard (Book Spa, Room Service, etc.)
class ActionTile extends StatelessWidget {
  const ActionTile({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    this.iconColor,
    this.accentColor,
    this.isDanger = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? accentColor;
  final bool isDanger;

  @override
  Widget build(BuildContext context) {
    final color = isDanger
        ? Colors.red
        : (accentColor ?? iconColor ?? AppColors.accentGold);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: AppColors.slate400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
