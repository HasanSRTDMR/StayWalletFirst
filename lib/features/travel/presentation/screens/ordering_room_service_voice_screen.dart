import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';

class OrderingRoomServiceVoiceScreen extends StatelessWidget {
  const OrderingRoomServiceVoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
        title: Column(
          children: [
            Text(
              'StayWallet',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    color: AppColors.primary,
                  ),
            ),
            Text(
              'AI Concierge',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontSize: 10,
                    color: AppColors.slate500,
                    letterSpacing: 0.5,
                  ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              // Transcript Section
              Column(
                children: [
                  Text(
                    'Listening...',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.slate400,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '"I\'d like to order a ',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                      children: [
                        const TextSpan(text: 'Wagyu Burger'),
                        TextSpan(
                          text: ' and a ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Coke',
                          style: TextStyle(color: AppColors.primary),
                        ),
                        const TextSpan(
                          text: ', please."',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Waveform Visualization
              SizedBox(
                height: 128,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildWaveBar(32, 0.4),
                    _buildWaveBar(48, 0.6),
                    _buildWaveBar(80, 1.0),
                    _buildWaveBar(96, 1.2),
                    _buildWaveBar(64, 1.0),
                    _buildWaveBar(112, 1.4),
                    _buildWaveBar(80, 1.0),
                    _buildWaveBar(48, 0.6),
                    _buildWaveBar(32, 0.4),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Live Processing Status
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                            child: Center(
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary.withOpacity(0.75),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'LIVE PROCESSING',
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  color: AppColors.slate600,
                                ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          'Analyzing Audio...',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'monospace',
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Item Cards
                  _buildItemCard(
                    context,
                    'Wagyu Beef Burger',
                    'Identified from speech',
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDva0imzEjNvSSMcw6kbvrEsn5nXceVrl-Dk1GyWtOEJCzM9YsdRP57rEXL_QeZy9AlY4pYKq6CAwiWWBs8sgP7T7_h1GgZgYhUpBxxfgqX9ijn60cbCfYI_zK0c6Bb6CkZg-pkpoNhcm_EHksZwaPBvazf1Wr4ZNSHU_94b2cbDodn5OptHxFs4jyv9FOZVEFF2YsIO43k_6dFQpsVQAy9luhkLKFl_6BkI5mlwBtEXiYChLJKCfzXaenltNjsKhPEOF9bNZIfEgfj',
                  ),
                  const SizedBox(height: 12),
                  _buildItemCard(
                    context,
                    'Coca Cola',
                    'Identified from speech',
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuBDQ-Dkn9Nh28oLSTkm5z1QcF6pHP0lIjrUSGd1c4GeqCbgFizkmrFFW8v5CfD7swu2F0aI1WSNBCcejnkkIjOoq3u9G1S-71tXB6_wUgwM8gBApfr5Gim6bkAtvxxqoIdfrLKWooyj9pCZJrng86tDI2juvG2pjTdidXW5h_ydw1y3lt7zWSAqOrE7LiOAG0HATy8S5rHmEKjA53QLu1AoTRlG7t0uEpYDlOZJIIZM3W5mShmxDGXDhVtvAeLkIqMc0jcT2ttYmDbF',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWaveBar(double height, double intensity) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: height),
      duration: Duration(milliseconds: (800 * intensity).round()),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Container(
          width: 6,
          height: value,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primary,
                AppColors.accentGold,
              ],
            ),
            borderRadius: BorderRadius.circular(3),
            boxShadow: intensity > 1.0
                ? [
                    BoxShadow(
                      color: AppColors.accentGold.withOpacity(0.6),
                      blurRadius: 20,
                    ),
                  ]
                : null,
          ),
        );
      },
    );
  }

  Widget _buildItemCard(
    BuildContext context,
    String title,
    String subtitle,
    String imageUrl,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.slate200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Icon(
                      Icons.check_circle,
                      color: AppColors.green,
                      size: 24,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.slate400,
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
