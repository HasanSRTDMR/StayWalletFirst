import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';

class CurrencyExchangeScreen extends StatefulWidget {
  const CurrencyExchangeScreen({super.key});

  @override
  State<CurrencyExchangeScreen> createState() => _CurrencyExchangeScreenState();
}

class _CurrencyExchangeScreenState extends State<CurrencyExchangeScreen> {
  String _amount = '1,250';

  void _appendDigit(String digit) {
    setState(() {
      if (digit == '.') {
        if (!_amount.contains('.')) _amount += '.';
      } else if (digit == '⌫') {
        if (_amount.isNotEmpty) _amount = _amount.substring(0, _amount.length - 1);
      } else {
        _amount += digit;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => context.pop(),
                  ),
                  const Text(
                    'Exchange Currency',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.info_outline),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    _GlassCard(
                      label: 'From',
                      balance: '\$12,450.00',
                      currency: 'USD',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _CurrencySelector(currency: 'USD'),
                          Expanded(
                            child: Text(
                              _amount,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.accentGold,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.backgroundDark,
                            width: 4,
                          ),
                        ),
                        child: const Icon(Icons.swap_vert, color: Colors.black87),
                      ),
                    ),
                    const SizedBox(height: 8),
                    _GlassCard(
                      label: 'To',
                      balance: 'Rate: 1 USD = 3.67 AED',
                      balanceColor: AppColors.accentGold,
                      currency: 'AED',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _CurrencySelector(currency: 'AED'),
                          Text(
                            '4,587.50',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _DetailRow(label: 'Exchange Fee (0.5%)', value: '\$6.25'),
                    _DetailRow(label: 'Estimated Arrival', value: 'Instant'),
                    const SizedBox(height: 24),
                    _Numpad(onKeyPressed: _appendDigit),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accentGold,
                          foregroundColor: Colors.black87,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Confirm Exchange'),
                            SizedBox(width: 8),
                            Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GlassCard extends StatelessWidget {
  const _GlassCard({
    required this.label,
    required this.balance,
    required this.currency,
    required this.child,
    this.balanceColor,
  });

  final String label;
  final String balance;
  final String currency;
  final Widget child;
  final Color? balanceColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.slate800.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label.toUpperCase(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.slate400,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                balance,
                style: TextStyle(
                  fontSize: 12,
                  color: balanceColor ?? AppColors.slate400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

class _CurrencySelector extends StatelessWidget {
  const _CurrencySelector({required this.currency});

  final String currency;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.slate800.withOpacity(0.8),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: AppColors.slate700,
            child: Text(
              currency[0],
              style: const TextStyle(fontSize: 10),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            currency,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.expand_more, color: AppColors.slate400, size: 20),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: AppColors.slate400)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class _Numpad extends StatelessWidget {
  const _Numpad({required this.onKeyPressed});

  final void Function(String) onKeyPressed;

  static const _keys = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['.', '0', '⌫'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 2,
      children: _keys.expand((row) {
        return row.map((key) {
          final isBackspace = key == '⌫';
          return InkWell(
            onTap: () => onKeyPressed(key),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              alignment: Alignment.center,
              child: isBackspace
                  ? Icon(Icons.backspace, color: AppColors.accentGold)
                  : Text(
                      key,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ),
          );
        });
      }).toList(),
    );
  }
}
