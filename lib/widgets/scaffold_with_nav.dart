import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/app_colors.dart';
import '../core/router/app_router.dart';

class ScaffoldWithNav extends StatelessWidget {
  const ScaffoldWithNav({
    super.key,
    required this.child,
  });

  final Widget child;

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith(AppRoutes.wallet)) return 1;
    if (location.startsWith(AppRoutes.digitalKey)) return 2;
    if (location.startsWith(AppRoutes.services)) return 3;
    if (location.startsWith(AppRoutes.profile)) return 4;
    return 0; // dashboard
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(AppRoutes.dashboard);
        break;
      case 1:
        context.go(AppRoutes.wallet);
        break;
      case 2:
        context.go(AppRoutes.digitalKey);
        break;
      case 3:
        context.go(AppRoutes.services);
        break;
      case 4:
        context.go(AppRoutes.profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundDark.withOpacity(0.95),
                border: Border(
                  top: BorderSide(color: AppColors.slate800),
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _NavItem(
                        icon: Icons.home_rounded,
                        label: 'Home',
                        isSelected: _calculateSelectedIndex(context) == 0,
                        onTap: () => _onItemTapped(context, 0),
                      ),
                      _NavItem(
                        icon: Icons.account_balance_wallet_outlined,
                        label: 'Wallet',
                        isSelected: _calculateSelectedIndex(context) == 1,
                        onTap: () => _onItemTapped(context, 1),
                      ),
                      _NavItem(
                        icon: Icons.vpn_key_rounded,
                        label: 'Key',
                        isSelected: _calculateSelectedIndex(context) == 2,
                        onTap: () => _onItemTapped(context, 2),
                        isCenter: true,
                      ),
                      _NavItem(
                        icon: Icons.apps,
                        label: 'Services',
                        isSelected: _calculateSelectedIndex(context) == 3,
                        onTap: () => _onItemTapped(context, 3),
                      ),
                      _NavItem(
                        icon: Icons.person_outline_rounded,
                        label: 'Profile',
                        isSelected: _calculateSelectedIndex(context) == 4,
                        onTap: () => _onItemTapped(context, 4),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.isCenter = false,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    if (isCenter) {
      return GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(color: AppColors.backgroundDark, width: 4),
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: isSelected ? AppColors.accentGold : AppColors.slate500,
              ),
            ),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
            color: isSelected ? AppColors.accentGold : AppColors.slate500,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: isSelected ? AppColors.accentGold : AppColors.slate500,
            ),
          ),
        ],
      ),
    );
  }
}
