import 'package:flutter/material.dart';

import 'core/router/app_router.dart';
import 'core/services/app_service.dart';
import 'core/theme/app_theme.dart';

void main() {
  // Initialize with mock data by default
  // To switch to API, call: AppService().initializeWithApi('https://your-api-url.com')
  AppService().initializeWithMock();
  
  runApp(const StayWalletApp());
}

class StayWalletApp extends StatelessWidget {
  const StayWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'StayWallet',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: AppRouter.router,
    );
  }
}
