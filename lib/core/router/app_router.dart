import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/wallet/presentation/screens/currency_exchange_screen.dart';
import '../../features/wallet/presentation/screens/wallet_screen.dart';
import '../../features/travel/presentation/screens/travel_services_screen.dart';
import '../../features/integrations/presentation/screens/connect_account_screen.dart';
import '../../features/integrations/presentation/screens/linked_success_screen.dart';
import '../../features/marketplace/presentation/screens/merchant_offers_screen.dart';
import '../../features/marketplace/presentation/screens/loyalty_rewards_screen.dart';
import '../../features/identity/presentation/screens/identity_verification_screen.dart';
import '../../features/identity/presentation/screens/passport_scan_screen.dart';
import '../../features/travel/presentation/screens/digital_key_details_screen.dart';
import '../../features/travel/presentation/screens/trip_itinerary_screen.dart';
import '../../features/travel/presentation/screens/trip_budgeting_screen.dart';
import '../../features/travel/presentation/screens/uber_ride_tracking_screen.dart';
import '../../features/travel/presentation/screens/frequent_flyer_screen.dart';
import '../../features/travel/presentation/screens/e_visa_screen.dart';
import '../../features/wallet/presentation/screens/spending_notification_screen.dart';
import '../../features/wallet/presentation/screens/smart_card_screen.dart';
import '../../features/travel/presentation/screens/checkout_bill_screen.dart';
import '../../features/travel/presentation/screens/order_confirmation_screen.dart';
import '../../features/travel/presentation/screens/order_tracking_screen.dart';
import '../../features/travel/presentation/screens/post_trip_expense_screen.dart';
import '../../features/marketplace/presentation/screens/profile_screen.dart';
import '../../widgets/scaffold_with_nav.dart';

/// Route names for type-safe navigation
class AppRoutes {
  AppRoutes._();

  static const String dashboard = '/';
  static const String wallet = '/wallet';
  static const String travelServices = '/travel-services';
  static const String currencyExchange = '/wallet/currency-exchange';
  static const String digitalKey = '/key';
  static const String services = '/services';
  static const String profile = '/profile';
  static const String merchantOffers = '/marketplace/merchant-offers';
  static const String loyaltyRewards = '/marketplace/loyalty-rewards';
  static const String identityVerification = '/identity/verification';
  static const String passportScan = '/identity/passport-scan';
  static const String digitalKeyDetails = '/travel/digital-key-details';
  static const String tripItinerary = '/travel/trip-itinerary';
  static const String tripBudgeting = '/travel/trip-budgeting';
  static const String uberRideTracking = '/travel/uber-tracking';
  static const String frequentFlyer = '/integrations/frequent-flyer';
  static const String eVisa = '/integrations/e-visa';
  static const String spendingNotification = '/wallet/spending-notification';
  static const String smartCard = '/wallet/smart-card';
  static const String checkoutBill = '/travel/checkout-bill';
  static const String orderConfirmation = '/travel/order-confirmation';
  static const String orderTracking = '/travel/order-tracking';
  static const String postTripExpense = '/travel/post-trip-expense';
  static const String connectAccount = '/integrations/connect';
  static const String linkedSuccess = '/integrations/linked-success';
}

/// GoRouter configuration for StayWallet app
class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.dashboard,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => ScaffoldWithNav(
          child: child,
        ),
        routes: [
          GoRoute(
            path: AppRoutes.dashboard,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: DashboardScreen(),
            ),
          ),
          GoRoute(
            path: AppRoutes.wallet,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: WalletScreen(),
            ),
          ),
          GoRoute(
            path: AppRoutes.digitalKey,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: DigitalKeyDetailsScreen(),
            ),
          ),
          GoRoute(
            path: AppRoutes.services,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: TravelServicesScreen(),
            ),
          ),
          GoRoute(
            path: AppRoutes.profile,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileScreen(),
            ),
          ),
        ],
      ),
      // Full-screen routes (no bottom nav)
      GoRoute(
        path: AppRoutes.currencyExchange,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const CurrencyExchangeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.merchantOffers,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const MerchantOffersScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.loyaltyRewards,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoyaltyRewardsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.identityVerification,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const IdentityVerificationScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.passportScan,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const PassportScanScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.digitalKeyDetails,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const DigitalKeyDetailsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.tripItinerary,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const TripItineraryScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.tripBudgeting,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const TripBudgetingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.uberRideTracking,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const UberRideTrackingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.frequentFlyer,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const FrequentFlyerScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.eVisa,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const EVisaScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.spendingNotification,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SpendingNotificationScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.smartCard,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SmartCardScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.checkoutBill,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const CheckoutBillScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.orderConfirmation,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const OrderConfirmationScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.orderTracking,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const OrderTrackingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.postTripExpense,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const PostTripExpenseScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: '${AppRoutes.connectAccount}/:provider',
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final provider = state.pathParameters['provider'] ?? 'booking';
          return CustomTransitionPage(
            key: state.pageKey,
            child: ConnectAccountScreen(provider: provider),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
      ),
      GoRoute(
        path: '${AppRoutes.linkedSuccess}/:provider',
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final provider = state.pathParameters['provider'] ?? 'booking';
          return CustomTransitionPage(
            key: state.pageKey,
            child: LinkedSuccessScreen(provider: provider),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
      ),
    ],
  );
}
