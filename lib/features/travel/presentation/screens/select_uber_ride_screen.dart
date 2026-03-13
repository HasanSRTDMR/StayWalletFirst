import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/app_router.dart';

class SelectUberRideScreen extends StatefulWidget {
  const SelectUberRideScreen({super.key});

  @override
  State<SelectUberRideScreen> createState() => _SelectUberRideScreenState();
}

class _SelectUberRideScreenState extends State<SelectUberRideScreen> {
  String? _selectedRide;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.slate100,
              border: Border(
                bottom: BorderSide(color: AppColors.slate200),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => context.pop(),
                ),
                const SizedBox(width: 12),
                Text(
                  'Ride to Airport',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.3),
                    ),
                  ),
                  child: Text(
                    'StayWallet Active',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Map Area
          Expanded(
            child: Stack(
              children: [
                // Map Background
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const NetworkImage(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuB0h_gwV79hv2DbH6qVin4SVX-WbrkihnfziX66C_hQdv59JUJwWmPdrnwoJNvz9Gj7a3tprqqZwHhG44pjs8MJzVPEWEDJi4udBIpBt44k6QsGPWtM8MqOJgW0wt04a0O-RA3isucyCYdFWOgUxbAk28ZuUZje4xfKsvjCqEPLQWnK8RcCpW_o7NvnkSz45F_vHw8026iCEfyttr9_7XhUt8f101H0scKOBU21x_LhowZ3fCPzHy6YcQXKcbf169FevD9qcJPv0J4x',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Map Overlay UI
                Positioned(
                  top: 16,
                  left: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.slate200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: AppColors.primary,
                              size: 16,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Current Location',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Container(
                            height: 24,
                            width: 2,
                            color: AppColors.slate200,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.red,
                              size: 16,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'SFO International Airport',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Location Button
                Positioned(
                  bottom: 24,
                  right: 16,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                        ),
                      ],
                      border: Border.all(color: AppColors.slate200),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.my_location, color: AppColors.slate700),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Ride Selection Bottom Sheet
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(32),
              ),
              border: Border(
                top: BorderSide(color: AppColors.slate200),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: 48,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColors.slate400,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose a ride',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 16),
                      // Ride Options
                      SizedBox(
                        height: 320,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _buildRideOption(
                                context,
                                'UberX',
                                '3 min away • 14:45 arrival',
                                '\$24.50',
                                'https://lh3.googleusercontent.com/aida-public/AB6AXuCF7M8hBTShI2MsO_PPkigs4g6iTBCKcXBfPN-YKOp5VGW5qsHkWL7TLyq4oMC4aVYaplx4KotLsqZq85TnElbJzlZ2Fmc8b994MyLDS2dMNbxbmJz9DcPz8kn7HtX_mHZeRdCgmsX_uB0qqi7cMJPQSAd-8em6kfzeo8KxNF3yHjO2UfJoaqy8w4iudLGs01d0evuXL16qxSXtW6WmKkjyxNmzL9VCsxDN6qgVR6wS-dOBQBr_ObrzE5VtBPaZmnz4WxK7NxfLxnY4',
                                4,
                                'uberx',
                              ),
                              const SizedBox(height: 8),
                              _buildRideOption(
                                context,
                                'Uber Comfort',
                                '5 min away • 14:47 arrival',
                                '\$32.00',
                                null,
                                4,
                                'comfort',
                              ),
                              const SizedBox(height: 8),
                              _buildRideOption(
                                context,
                                'UberXL',
                                '7 min away • 14:49 arrival',
                                '\$38.50',
                                null,
                                6,
                                'uberxl',
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _selectedRide != null
                              ? () => context.push(AppRoutes.uberRideTracking)
                              : null,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Request Ride'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRideOption(
    BuildContext context,
    String name,
    String details,
    String price,
    String? imageUrl,
    int capacity,
    String rideId,
  ) {
    final isSelected = _selectedRide == rideId;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRide = rideId;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : AppColors.slate200,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.slate100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: imageUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Icon(
                      Icons.directions_car,
                      color: AppColors.slate400,
                      size: 32,
                    ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.person,
                        size: 16,
                        color: AppColors.slate400,
                      ),
                      Text(
                        '$capacity',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.slate400,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    details,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.slate400,
                        ),
                  ),
                ],
              ),
            ),
            Text(
              price,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
