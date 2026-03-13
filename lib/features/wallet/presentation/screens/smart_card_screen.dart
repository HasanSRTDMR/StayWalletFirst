import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/app_router.dart';

class SmartCardScreen extends StatefulWidget {
  const SmartCardScreen({super.key});

  @override
  State<SmartCardScreen> createState() => _SmartCardScreenState();
}

class _SmartCardScreenState extends State<SmartCardScreen> {
  bool _roomAccessSarah = true;
  bool _paymentSarah = false;
  bool _roomAccessJames = false;
  bool _paymentJames = false;
  bool _freezeCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => context.pop(),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.slate800.withOpacity(0.5),
          ),
        ),
        title: const Text(
          'Smart Card Management',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.3,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: AppColors.slate800.withOpacity(0.5),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Preview Section
            const SizedBox(height: 16),
            _buildCardPreview(),
            const SizedBox(height: 32),
            // Balance & Apple Wallet
            _buildBalanceSection(),
            const SizedBox(height: 16),
            _buildAppleWalletButton(),
            const SizedBox(height: 32),
            // Family Access
            _buildFamilyAccessSection(),
            const SizedBox(height: 32),
            // Security Settings
            _buildSecuritySettings(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildCardPreview() {
    return AspectRatio(
      aspectRatio: 1.58,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1A1F2C), Color(0xFF0A0C10)],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 24,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: -40,
              right: -40,
              child: Container(
                width: 128,
                height: 128,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 48,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.accentGold.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.accentGold.withOpacity(0.3),
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 32,
                          height: 24,
                          decoration: BoxDecoration(
                            color: AppColors.accentGold.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'StayWallet',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: AppColors.accentGold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Primary Member',
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 2,
                        color: AppColors.slate400,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'ALEXANDER WALKER',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 4,
                        color: AppColors.slate100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.slate800.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Primary Balance',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  color: AppColors.slate400,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '\$12,450.00',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.account_balance_wallet, color: AppColors.primary),
          ),
        ],
      ),
    );
  }

  Widget _buildAppleWalletButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Adding to Apple Wallet...'),
              backgroundColor: AppColors.cardDark,
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade700),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.apple, size: 28),
            const SizedBox(width: 12),
            const Text(
              'Add to Apple Wallet',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFamilyAccessSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Family Access',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton.icon(
              onPressed: () => context.push(AppRoutes.secondaryCardholderAppView),
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Issue New Card'),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildFamilyMemberCard(
          initials: 'SW',
          name: 'Sarah Walker',
          isActive: true,
          roomAccess: _roomAccessSarah,
          payment: _paymentSarah,
          onRoomAccessChanged: (v) => setState(() => _roomAccessSarah = v),
          onPaymentChanged: (v) => setState(() => _paymentSarah = v),
        ),
        const SizedBox(height: 16),
        _buildFamilyMemberCard(
          initials: 'JW',
          name: 'James Walker',
          isActive: false,
          roomAccess: _roomAccessJames,
          payment: _paymentJames,
          onRoomAccessChanged: (v) => setState(() => _roomAccessJames = v),
          onPaymentChanged: (v) => setState(() => _paymentJames = v),
          isLocked: true,
        ),
      ],
    );
  }

  Widget _buildFamilyMemberCard({
    required String initials,
    required String name,
    required bool isActive,
    required bool roomAccess,
    required bool payment,
    required ValueChanged<bool> onRoomAccessChanged,
    required ValueChanged<bool> onPaymentChanged,
    bool isLocked = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.slate800.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: isLocked
                          ? AppColors.slate700
                          : AppColors.primary.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        initials,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isLocked
                              ? AppColors.slate400
                              : AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          if (isActive)
                            Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: AppColors.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                          if (isActive) const SizedBox(width: 6),
                          Text(
                            isActive ? 'Active' : 'Locked',
                            style: TextStyle(
                              fontSize: 12,
                              color: isActive
                                  ? AppColors.green
                                  : AppColors.slate500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Icon(Icons.chevron_right, color: AppColors.slate500),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.white.withOpacity(0.05)),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Room Access',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.slate400,
                          ),
                        ),
                        _buildToggle(roomAccess, onRoomAccessChanged),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.slate400,
                          ),
                        ),
                        _buildToggle(payment, onPaymentChanged),
                      ],
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

  Widget _buildToggle(bool value, ValueChanged<bool> onChanged) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 32,
        height: 20,
        decoration: BoxDecoration(
          color: value ? AppColors.primary : AppColors.slate600,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Align(
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            width: 12,
            height: 12,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSecuritySettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Security Settings',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildSecurityTile(
          icon: Icons.block,
          iconColor: Colors.amber,
          title: 'Freeze Card',
          subtitle: 'Temporarily disable all transactions',
          isToggle: true,
          toggleValue: _freezeCard,
          onToggle: (v) => setState(() => _freezeCard = v),
        ),
        const SizedBox(height: 4),
        _buildSecurityTile(
          icon: Icons.key,
          iconColor: Colors.blue,
          title: 'Change PIN',
          subtitle: 'Secure your physical card access',
          isToggle: false,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Change PIN'),
                backgroundColor: AppColors.cardDark,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSecurityTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    bool isToggle = false,
    bool toggleValue = false,
    ValueChanged<bool>? onToggle,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isToggle ? () => onToggle?.call(!toggleValue) : onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.slate500,
                      ),
                    ),
                  ],
                ),
              ),
              if (isToggle)
                _buildToggle(toggleValue, onToggle ?? (_) {})
              else
                Icon(Icons.chevron_right, color: AppColors.slate500),
            ],
          ),
        ),
      ),
    );
  }
}
