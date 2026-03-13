import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/app_router.dart';

class IntegratedTravelHubScreen extends StatelessWidget {
  const IntegratedTravelHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Travel Services'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: AppColors.primary),
            onPressed: () => context.push(AppRoutes.spendingNotification),
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () => context.push(AppRoutes.profile),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Connected Accounts
            Text(
              'CONNECTED ACCOUNTS',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.slate500,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () =>
                        context.push('${AppRoutes.connectAccount}/booking'),
                    child: _buildConnectedAccountChip(
                      context,
                      'Booking.com',
                      'Genius Level 2',
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () =>
                        context.push('${AppRoutes.connectAccount}/sixt'),
                    child: _buildConnectedAccountChip(
                      context,
                      'Sixt',
                      'Platinum Status',
                      Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () =>
                        context.push('${AppRoutes.connectAccount}/allianz'),
                    child: _buildConnectedAccountChip(
                      context,
                      'Allianz',
                      'Active Policy',
                      Colors.blue.shade800,
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () =>
                        context.push('${AppRoutes.connectAccount}/uber'),
                    child: _buildConnectedAccountChip(
                      context,
                      'Uber',
                      'Connect rides',
                      Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Frequent Flyer Banner
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.primary.withOpacity(0.2),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.flight,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Frequent Flyer Program',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () => context.push(AppRoutes.frequentFlyer),
                        child: Text(
                          'SYNC ALL',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildFrequentFlyerRow(
                    context,
                    'Miles & Smiles (THY)',
                    '45,200 pts',
                    Colors.red,
                  ),
                  const SizedBox(height: 8),
                  _buildFrequentFlyerRow(
                    context,
                    'Lufthansa Miles & More',
                    '12,850 pts',
                    Colors.blue,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Search
            TextField(
              decoration: InputDecoration(
                hintText: 'Search partners or services',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: AppColors.slate100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Partner Categories
            Text(
              'Partner Categories',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.1,
              children: [
                GestureDetector(
                  onTap: () => context.push(AppRoutes.selectUberRide),
                  child: _buildCategoryCard(
                    context,
                    Icons.directions_car,
                    'Rental Car',
                    'Sixt / Avis / Hertz',
                    Colors.blue,
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      context.push('${AppRoutes.connectAccount}/booking'),
                  child: _buildCategoryCard(
                    context,
                    Icons.hotel,
                    'Hotel Booking',
                    'via Booking.com',
                    AppColors.emerald,
                  ),
                ),
                GestureDetector(
                  onTap: () => context.push(AppRoutes.merchantOffers),
                  child: _buildCategoryCard(
                    context,
                    Icons.restaurant,
                    'Restaurants',
                    'Cipriani & Local Hotspots',
                    Colors.orange,
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      context.push(AppRoutes.allianzTravelInsuranceSelection),
                  child: _buildCategoryCard(
                    context,
                    Icons.health_and_safety,
                    'Travel Insurance',
                    'Allianz Global Assistance',
                    Colors.purple,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // E-Visa Card
            GestureDetector(
              onTap: () => context.push(AppRoutes.eVisa),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.slate800.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.slate800),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.fact_check,
                        color: Colors.amber,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'E-Visa Services',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            'Check eligibility for US, EU, and 50+ countries',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColors.slate500,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: AppColors.slate400,
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

  Widget _buildConnectedAccountChip(
    BuildContext context,
    String label,
    String sublabel,
    Color color,
  ) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.slate800,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.slate700),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.emerald,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            sublabel,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.slate400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFrequentFlyerRow(
    BuildContext context,
    String label,
    String points,
    Color iconColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.star,
                  size: 14,
                  color: iconColor,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Text(
            points,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    Color color, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.slate800.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.slate800),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.slate500,
                ),
              ),
            ],
          ),
        ));
  }
}
