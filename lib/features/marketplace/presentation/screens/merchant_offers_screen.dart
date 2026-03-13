import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';

void _showMapView(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.backgroundDark,
    builder: (ctx) => Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.map, size: 64, color: AppColors.primary),
          const SizedBox(height: 16),
          const Text(
            'Map View',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Merchant locations will appear on the map.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.slate400),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Close'),
            ),
          ),
        ],
      ),
    ),
  );
}

void _showMerchantDetail(BuildContext context, String title, String subtitle) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.cardDark,
    builder: (ctx) => Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(subtitle, style: TextStyle(color: AppColors.slate400)),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Opening directions to $title'), backgroundColor: AppColors.cardDark),
                    );
                  },
                  icon: const Icon(Icons.directions),
                  label: const Text('Directions'),
                  style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColors.primary)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Reservation requested for $title'), backgroundColor: AppColors.cardDark),
                    );
                  },
                  icon: const Icon(Icons.restaurant),
                  label: const Text('Reserve'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Close'),
            ),
          ),
        ],
      ),
    ),
  );
}

class MerchantOffersScreen extends StatefulWidget {
  const MerchantOffersScreen({super.key});

  @override
  State<MerchantOffersScreen> createState() => _MerchantOffersScreenState();
}

class _MerchantOffersScreenState extends State<MerchantOffersScreen> {
  String _selectedFilter = 'Dining';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.backgroundDark.withOpacity(0.8),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
            ),
            title: const Text('Local Directory'),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.map, color: AppColors.primary),
                onPressed: () => _showMapView(context),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search merchants, dining, tours...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: AppColors.slate900,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.slate800),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _FilterChip(
                          icon: Icons.restaurant,
                          label: 'Dining',
                          isSelected: _selectedFilter == 'Dining',
                          onTap: () => setState(() => _selectedFilter = 'Dining'),
                        ),
                        const SizedBox(width: 12),
                        _FilterChip(
                          icon: Icons.shopping_bag,
                          label: 'Shopping',
                          isSelected: _selectedFilter == 'Shopping',
                          onTap: () => setState(() => _selectedFilter = 'Shopping'),
                        ),
                        const SizedBox(width: 12),
                        _FilterChip(
                          icon: Icons.explore,
                          label: 'Tours',
                          isSelected: _selectedFilter == 'Tours',
                          onTap: () => setState(() => _selectedFilter = 'Tours'),
                        ),
                        const SizedBox(width: 12),
                        _FilterChip(
                          icon: Icons.spa,
                          label: 'Spa',
                          isSelected: _selectedFilter == 'Spa',
                          onTap: () => setState(() => _selectedFilter = 'Spa'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Exclusive Offers',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Showing all exclusive offers'),
                              backgroundColor: AppColors.cardDark,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                        child: Text(
                          'See All',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.accentGold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => _showMerchantDetail(
                      context,
                      'Mirage Grill',
                      'Fine Dining • International Cuisine',
                    ),
                    child: _MerchantCard(
                      title: 'Mirage Grill',
                      subtitle: 'Fine Dining • International Cuisine',
                      discount: '15% Off with StayWallet',
                      distance: '0.4 km away',
                      rating: 4.9,
                      imageUrl: 'https://picsum.photos/400/200?random=1',
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => _showMerchantDetail(
                      context,
                      'Dubai Mall Luxury Shop',
                      'Fashion • Accessories • Premium Brands',
                    ),
                    child: _MerchantCard(
                      title: 'Dubai Mall Luxury Shop',
                      subtitle: 'Fashion • Accessories • Premium Brands',
                      discount: '10% Off with StayWallet',
                      distance: '1.2 km away',
                      rating: 4.8,
                      imageUrl: 'https://picsum.photos/400/200?random=2',
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => _showMerchantDetail(
                      context,
                      'Desert Safari Tours',
                      'Adventure • Cultural • Evening Tours',
                    ),
                    child: _MerchantCard(
                      title: 'Desert Safari Tours',
                      subtitle: 'Adventure • Cultural • Evening Tours',
                      discount: '20% Off with StayWallet',
                      distance: '5.0 km away',
                      rating: 5.0,
                      imageUrl: 'https://picsum.photos/400/200?random=3',
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.slate800,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: isSelected ? Colors.white : AppColors.slate400),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected ? Colors.white : AppColors.slate400,
            ),
          ),
        ],
      ),
    ),
    );
  }
}

class _MerchantCard extends StatelessWidget {
  const _MerchantCard({
    required this.title,
    required this.subtitle,
    required this.discount,
    required this.distance,
    required this.rating,
    required this.imageUrl,
  });

  final String title;
  final String subtitle;
  final String discount;
  final String distance;
  final double rating;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.slate800),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 192,
                width: double.infinity,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.accentGold,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, size: 14, color: Colors.black87),
                      const SizedBox(width: 4),
                      Text(
                        discount,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.location_on, size: 14, color: Colors.white),
                      const SizedBox(width: 4),
                      Text(
                        distance,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.slate400,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, size: 18, color: AppColors.accentGold),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.accentGold,
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
