import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/app_router.dart';

class AIVoiceAssistantScreen extends StatelessWidget {
  const AIVoiceAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const NetworkImage(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuCbeb4ViQqou-PxiMwcGeAgYT4_erV7Q5czLmnzvFMRYPyUGSBh94NjYM928EX67i5RnwAasNcGuq4wMyVDQSx9txQ1KGqBXF4Bp5CEDErLZst_bNyoUlp6Es9hchuYjaAxI59Y4TUXmKmpwWgI8tkq1RIIJHKXrj6ZrP_tEZIM6EhckZzCCl62EICto0NNH2r_RDQm27DewDiYjxHoUNpEfvCY3fOEuOW7Rwke4JFda6qduoNaSVObwhitxaz6pRWk3FFTOCjaK7LW',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go(AppRoutes.dashboard);
                        }
                      },
                    ),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: AppColors.accentGold,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.accentGold.withOpacity(0.8),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'CONCIERGE LIVE',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: AppColors.slate400,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.white),
                      onPressed: () => _showSettingsDialog(context),
                    ),
                  ],
                ),
              ),
              // Main Content
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Greeting & Transcript
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          Text(
                            'Hello Mr. Alexander,',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'how can I help you today?',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.slate800.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppColors.slate700.withOpacity(0.5),
                              ),
                            ),
                            child: Text(
                              '"I\'d like to see my current room charges..."',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.slate400,
                                    fontStyle: FontStyle.italic,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // AI Orb Visualization
                    Expanded(
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Glowing Background
                            Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: [
                                    AppColors.primary.withOpacity(0.4),
                                    AppColors.accentGold.withOpacity(0.1),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                            // Center Orb
                            Container(
                              width: 192,
                              height: 192,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [AppColors.primary, AppColors.accentGold],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(0.3),
                                    blurRadius: 50,
                                  ),
                                ],
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.backgroundDark,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    _buildWaveBar(32, 1.0),
                                    _buildWaveBar(56, 1.2),
                                    _buildWaveBar(40, 0.8),
                                    _buildWaveBar(64, 1.1),
                                    _buildWaveBar(48, 0.9),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Suggested Commands
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          Text(
                            'SUGGESTED ACTIONS',
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: AppColors.slate500,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                          ),
                          const SizedBox(height: 16),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _buildSuggestedAction(
                                  context,
                                  Icons.restaurant,
                                  'Book Mirage Grill',
                                  onTap: () {
                                    final currentRoute = GoRouterState.of(context).uri.path;
                                    if (currentRoute != AppRoutes.orderingRoomServiceVoice) {
                                      context.push(AppRoutes.orderingRoomServiceVoice);
                                    }
                                  },
                                ),
                                const SizedBox(width: 12),
                                _buildSuggestedAction(
                                  context,
                                  Icons.account_balance_wallet,
                                  'Check balance',
                                  onTap: () {
                                    final currentRoute = GoRouterState.of(context).uri.path;
                                    // Wallet is a ShellRoute, use go() instead of push()
                                    if (currentRoute != AppRoutes.wallet) {
                                      context.go(AppRoutes.wallet);
                                    }
                                  },
                                ),
                                const SizedBox(width: 12),
                                _buildSuggestedAction(
                                  context,
                                  Icons.meeting_room,
                                  'Unlock room',
                                  onTap: () {
                                    final currentRoute = GoRouterState.of(context).uri.path;
                                    if (currentRoute != AppRoutes.digitalKeyDetails) {
                                      context.push(AppRoutes.digitalKeyDetails);
                                    }
                                  },
                                ),
                                const SizedBox(width: 12),
                                _buildSuggestedAction(
                                  context,
                                  Icons.explore,
                                  'Find tours',
                                  onTap: () {
                                    final currentRoute = GoRouterState.of(context).uri.path;
                                    if (currentRoute != AppRoutes.tripItinerary) {
                                      context.push(AppRoutes.tripItinerary);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundDark.withOpacity(0.8),
          border: Border(
            top: BorderSide(color: AppColors.slate800),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 'Home', () {
              if (!context.mounted) return;
              final currentRoute = GoRouterState.of(context).uri.path;
              // Dashboard is a ShellRoute, use go() instead of push()
              if (currentRoute != AppRoutes.dashboard) {
                context.go(AppRoutes.dashboard);
              } else if (context.canPop()) {
                context.pop();
              }
            }),
            GestureDetector(
              onTap: () => _toggleMicrophone(context),
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.4),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: const Icon(Icons.mic, color: Colors.white, size: 28),
              ),
            ),
            _buildNavItem(Icons.person, 'Profile', () {
              if (!context.mounted) return;
              final currentRoute = GoRouterState.of(context).uri.path;
              // Profile is a ShellRoute, use go() instead of push()
              if (currentRoute != AppRoutes.profile) {
                context.go(AppRoutes.profile);
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildWaveBar(double height, double delay) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: height),
      duration: Duration(milliseconds: (1000 * delay).round()),
      builder: (context, value, child) {
        return Container(
          width: 6,
          height: value,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(3),
          ),
        );
      },
      onEnd: () {},
    );
  }

  Widget _buildSuggestedAction(
    BuildContext context,
    IconData icon,
    String label, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ?? () => _handleVoiceCommand(context, label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.slate800.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.slate700.withOpacity(0.5),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.accentGold, size: 20),
            const SizedBox(width: 12),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.slate500, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: AppColors.slate500,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

// Helper functions for AI Voice Assistant
void _showSettingsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: AppColors.cardDark,
      title: const Text('Concierge Settings'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const Icon(Icons.volume_up, color: AppColors.primary),
            title: const Text('Voice Volume'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pop(context);
              _showVolumeSettings(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.language, color: AppColors.primary),
            title: const Text('Language'),
            trailing: const Text('English'),
            onTap: () {
              Navigator.pop(context);
              _showLanguageSettings(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications, color: AppColors.primary),
            title: const Text('Notifications'),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
          child: const Text('Close'),
        ),
      ],
    ),
  );
}

void _showVolumeSettings(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: AppColors.cardDark,
      title: const Text('Voice Volume'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Slider(
            value: 0.7,
            onChanged: (value) {},
            min: 0.0,
            max: 1.0,
          ),
          const Text('70%'),
        ],
      ),
      actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            child: const Text('OK'),
          ),
      ],
    ),
  );
}

void _showLanguageSettings(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: AppColors.cardDark,
      title: const Text('Select Language'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('English'),
            trailing: const Icon(Icons.check, color: AppColors.primary),
            onTap: () => Navigator.of(context, rootNavigator: true).pop(),
          ),
          ListTile(
            title: const Text('Turkish'),
            onTap: () => Navigator.of(context, rootNavigator: true).pop(),
          ),
          ListTile(
            title: const Text('Arabic'),
            onTap: () => Navigator.of(context, rootNavigator: true).pop(),
          ),
        ],
      ),
    ),
  );
}

void _toggleMicrophone(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Row(
        children: [
          Icon(Icons.mic, color: Colors.white),
          SizedBox(width: 12),
          Text('Listening...'),
        ],
      ),
      backgroundColor: AppColors.primary,
      duration: const Duration(seconds: 2),
    ),
  );
}

void _handleVoiceCommand(BuildContext context, String command) {
  if (!context.mounted) return;
  
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(
            child: Text('Processing: $command'),
          ),
        ],
      ),
      backgroundColor: AppColors.green,
      duration: const Duration(seconds: 2),
    ),
  );
  
  // Navigate based on command
  Future.delayed(const Duration(seconds: 1), () {
    if (!context.mounted) return;
    
    try {
      final currentRoute = GoRouterState.of(context).uri.path;
      
      switch (command.toLowerCase()) {
        case 'book mirage grill':
          if (currentRoute != AppRoutes.orderingRoomServiceVoice) {
            context.push(AppRoutes.orderingRoomServiceVoice);
          }
          break;
        case 'check balance':
          // Wallet is a ShellRoute, use go() instead of push()
          if (currentRoute != AppRoutes.wallet) {
            context.go(AppRoutes.wallet);
          }
          break;
        case 'unlock room':
          if (currentRoute != AppRoutes.digitalKeyDetails) {
            context.push(AppRoutes.digitalKeyDetails);
          }
          break;
        case 'find tours':
          if (currentRoute != AppRoutes.tripItinerary) {
            context.push(AppRoutes.tripItinerary);
          }
          break;
      }
    } catch (e) {
      // Ignore navigation errors
    }
  });
}
