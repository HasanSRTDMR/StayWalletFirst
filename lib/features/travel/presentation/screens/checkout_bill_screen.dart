import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';

class CheckoutBillScreen extends StatelessWidget {
  const CheckoutBillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Checkout & Bill Review'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _BillRow(label: 'Room charges', amount: '1,250 AED'),
                  _BillRow(label: 'Dining', amount: '345 AED'),
                  _BillRow(label: 'Spa services', amount: '180 AED'),
                  const Divider(color: AppColors.slate700),
                  _BillRow(
                    label: 'Total',
                    amount: '1,775 AED',
                    isBold: true,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Confirm Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}

class _BillRow extends StatelessWidget {
  const _BillRow({
    required this.label,
    required this.amount,
    this.isBold = false,
  });

  final String label;
  final String amount;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.w500)),
          Text(amount, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.w500)),
        ],
      ),
    );
  }
}
