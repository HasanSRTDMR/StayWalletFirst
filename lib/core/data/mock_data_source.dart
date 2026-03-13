import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/digital_key_model.dart';
import '../models/integrated_travel_hub_model.dart';
import '../models/loyalty_status_model.dart';
import '../models/merchant_offer_model.dart';
import '../models/order_tracking_model.dart';
import '../models/post_trip_expense_model.dart';
import '../models/transaction_model.dart';
import '../models/trip_budget_model.dart';
import '../models/uber_ride_tracking_model.dart';
import '../models/user_model.dart';
import '../models/wallet_model.dart';
import 'data_source.dart';

/// Mock data source that reads from JSON file
/// Simulates API delay to make it feel realistic
class MockDataSource implements DataSource {
  Map<String, dynamic>? _cachedData;

  // Simulate network delay
  Future<T> _simulateDelay<T>(T data, {Duration delay = const Duration(milliseconds: 500)}) async {
    await Future.delayed(delay);
    return data;
  }

  /// Load JSON data from assets
  Future<Map<String, dynamic>> _loadJsonData() async {
    if (_cachedData != null) {
      return _cachedData!;
    }

    try {
      // Try loading from assets
      final String jsonString = await rootBundle.loadString('assets/data/mock_data.json');
      if (jsonString.isEmpty) {
        throw Exception('JSON file is empty');
      }
      final decoded = json.decode(jsonString) as Map<String, dynamic>;
      _cachedData = decoded;
      return _cachedData!;
    } catch (e) {
      // Fallback to hardcoded data if JSON file cannot be loaded
      // This is expected during development if assets haven't been properly loaded
      // Note: To fix JSON loading, ensure:
      // 1. Run 'flutter clean' and 'flutter pub get'
      // 2. Completely restart the app (not just hot reload)
      // 3. Check that assets/data/mock_data.json exists
      if (_cachedData == null) {
        _cachedData = _getFallbackData();
      }
      return _cachedData!;
    }
  }

  /// Fallback data if JSON file cannot be loaded
  Map<String, dynamic> _getFallbackData() {
    return {
      'user': {
        'id': 'user_001',
        'firstName': 'Mr.',
        'lastName': 'Alexander',
        'email': 'alexander@example.com',
        'profileImageUrl': null,
      },
      'wallet': {
        'id': 'wallet_001',
        'primaryBalance': 1250.00,
        'primaryCurrency': 'AED',
        'otherBalances': {
          'USD': 340.50,
          'EUR': 312.00,
        },
        'lastUpdated': DateTime.now().toIso8601String(),
      },
      'transactions': [
        {
          'id': 'txn_001',
          'title': 'Mirage Grill & Lounge',
          'amount': '- 245.00 AED',
          'subtitle': 'Hotel Restaurant',
          'type': 'expense',
          'timestamp': DateTime.now().subtract(const Duration(hours: 2)).toIso8601String(),
          'trailingText': '15% Discount Applied',
          'iconName': 'dinner_dining',
        },
        {
          'id': 'txn_002',
          'title': 'Dubai Mall Merchant',
          'amount': '- 89.00 AED',
          'subtitle': 'External Merchant • 2 hours ago',
          'type': 'expense',
          'timestamp': DateTime.now().subtract(const Duration(hours: 2)).toIso8601String(),
          'iconName': 'shopping_bag',
        },
        {
          'id': 'txn_003',
          'title': 'Wallet Top-up',
          'amount': '+ 500.00 AED',
          'subtitle': 'Visa **** 4421 • Yesterday',
          'type': 'income',
          'timestamp': DateTime.now().subtract(const Duration(days: 1)).toIso8601String(),
          'iconName': 'add_circle',
        },
      ],
      'loyaltyStatus': {
        'tier': 'Gold Status',
        'currentPoints': 850,
        'nextTierPoints': 1000,
        'nextTier': 'Diamond Status',
        'message': '150 points until your next luxury reward',
      },
      'digitalKey': {
        'id': 'key_001',
        'hotelName': 'Grand Mirage Dubai',
        'roomInfo': 'Room 402 • Deluxe Suite',
        'roomNumber': '402',
        'roomType': 'Deluxe Suite',
        'isActive': true,
        'imageUrl':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDtMOquMZeSy5vbzeF1LyryVO1AETid7GB67wV6i8kqXSNqkAsXfsAzRKXuseCUI2zH2sK5Z6TdndvSmcPr7Mu_yrmCCpC-Ydfg30NxSSULPkq6LLfd7FAtIHwyeY0Zb-b8um-lKJSQHDRcwFMeA9U7jgXoIzOLGljO04JUSG5XViXtxdchkrIeME6I2w67STW_VKU6kut1C-eNfDLiS2sp3AFmOYlc-e8X1tlniVuJXQzC3lQfh8rJij26uUgBs6yObDaLnMQOD2UV',
        'checkInDate': DateTime.now().subtract(const Duration(days: 2)).toIso8601String(),
        'checkOutDate': DateTime.now().add(const Duration(days: 5)).toIso8601String(),
      },
      'tripBudget': {
        'totalBudget': 2500,
        'currency': 'AED',
        'spentAmount': 1625,
        'spentLabel': '1,625 AED spent',
        'categories': [
          {'label': 'Accommodation', 'amount': '1,200 AED', 'percent': 48},
          {'label': 'Dining', 'amount': '350 AED', 'percent': 14},
          {'label': 'Transport', 'amount': '180 AED', 'percent': 7},
          {'label': 'Activities', 'amount': '245 AED', 'percent': 10},
        ],
      },
      'postTripExpenses': [
        {'id': 'exp_001', 'name': 'Dubai Trip - Dec 2024', 'totalExpenses': '2,450 AED', 'currency': 'AED'},
      ],
      'merchantOffers': {
        'filters': [
          {'id': 'dining', 'label': 'Dining', 'icon': 'restaurant'},
          {'id': 'shopping', 'label': 'Shopping', 'icon': 'shopping_bag'},
          {'id': 'tours', 'label': 'Tours', 'icon': 'explore'},
          {'id': 'spa', 'label': 'Spa', 'icon': 'spa'},
        ],
        'merchants': [
          {'id': 'm1', 'title': 'Mirage Grill', 'subtitle': 'Fine Dining • International Cuisine', 'discount': '15% Off with StayWallet', 'distance': '0.4 km away', 'rating': 4.9, 'imageUrl': 'https://picsum.photos/400/200?random=1'},
          {'id': 'm2', 'title': 'Dubai Mall Luxury Shop', 'subtitle': 'Fashion • Accessories • Premium Brands', 'discount': '10% Off with StayWallet', 'distance': '1.2 km away', 'rating': 4.8, 'imageUrl': 'https://picsum.photos/400/200?random=2'},
          {'id': 'm3', 'title': 'Desert Safari Tours', 'subtitle': 'Adventure • Cultural • Evening Tours', 'discount': '20% Off with StayWallet', 'distance': '5.0 km away', 'rating': 5.0, 'imageUrl': 'https://picsum.photos/400/200?random=3'},
        ],
      },
      'orderTracking': {
        'orderId': '#4521',
        'title': 'Room Service - Order #4521',
        'status': 'Preparing',
        'eta': 'ETA 25 min',
        'statusEta': 'Preparing • ETA 25 min',
      },
      'uberRideTracking': {
        'rideType': 'UberX',
        'carModel': 'Toyota Camry • ABC 123',
        'pickup': 'Grand Mirage Dubai',
        'destination': 'Dubai Mall',
        'eta': '8 min',
      },
      'integratedTravelHub': {
        'connectedAccounts': [
          {'label': 'Booking.com', 'sublabel': 'Genius Level 2', 'colorHex': '4285F4'},
          {'label': 'Sixt', 'sublabel': 'Platinum Status', 'colorHex': 'FF9800'},
          {'label': 'Allianz', 'sublabel': 'Active Policy', 'colorHex': '1565C0'},
        ],
        'frequentFlyerPrograms': [
          {'label': 'Miles & Smiles (THY)', 'points': '45,200 pts', 'colorHex': 'E53935'},
          {'label': 'Lufthansa Miles & More', 'points': '12,850 pts', 'colorHex': '1976D2'},
        ],
        'categories': [
          {'icon': 'directions_car', 'title': 'Rental Car', 'subtitle': 'Sixt / Avis / Hertz', 'colorHex': '1976D2'},
          {'icon': 'hotel', 'title': 'Hotel Booking', 'subtitle': 'via Booking.com', 'colorHex': '10B981'},
          {'icon': 'restaurant', 'title': 'Restaurants', 'subtitle': 'Cipriani & Local Hotspots', 'colorHex': 'FF9800'},
          {'icon': 'health_and_safety', 'title': 'Travel Insurance', 'subtitle': 'Allianz Global Assistance', 'colorHex': '7B1FA2'},
        ],
      },
    };
  }

  @override
  Future<UserModel> getUser() async {
    final data = await _loadJsonData();
    return _simulateDelay(UserModel.fromJson(data['user'] as Map<String, dynamic>));
  }

  @override
  Future<WalletModel> getWallet() async {
    final data = await _loadJsonData();
    return _simulateDelay(WalletModel.fromJson(data['wallet'] as Map<String, dynamic>));
  }

  @override
  Future<List<TransactionModel>> getTransactions({int limit = 10}) async {
    final data = await _loadJsonData();
    final transactionsList = data['transactions'] as List<dynamic>;
    
    final transactions = transactionsList
        .take(limit)
        .map((json) => TransactionModel.fromJson(json as Map<String, dynamic>))
        .toList();

    return _simulateDelay(transactions);
  }

  @override
  Future<LoyaltyStatusModel> getLoyaltyStatus() async {
    final data = await _loadJsonData();
    return _simulateDelay(
      LoyaltyStatusModel.fromJson(data['loyaltyStatus'] as Map<String, dynamic>),
    );
  }

  @override
  Future<DigitalKeyModel> getDigitalKey() async {
    final data = await _loadJsonData();
    return _simulateDelay(
      DigitalKeyModel.fromJson(data['digitalKey'] as Map<String, dynamic>),
    );
  }

  @override
  Future<TripBudgetModel> getTripBudget() async {
    final data = await _loadJsonData();
    return _simulateDelay(
      TripBudgetModel.fromJson(data['tripBudget'] as Map<String, dynamic>),
    );
  }

  @override
  Future<List<PostTripExpenseModel>> getPostTripExpenses() async {
    final data = await _loadJsonData();
    final list = data['postTripExpenses'] as List<dynamic>;
    return _simulateDelay(
      list
          .map((e) => PostTripExpenseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  Future<MerchantOffersDataModel> getMerchantOffers() async {
    final data = await _loadJsonData();
    return _simulateDelay(
      MerchantOffersDataModel.fromJson(
        data['merchantOffers'] as Map<String, dynamic>,
      ),
    );
  }

  @override
  Future<OrderTrackingModel> getOrderTracking() async {
    final data = await _loadJsonData();
    return _simulateDelay(
      OrderTrackingModel.fromJson(data['orderTracking'] as Map<String, dynamic>),
    );
  }

  @override
  Future<UberRideTrackingModel> getUberRideTracking() async {
    final data = await _loadJsonData();
    return _simulateDelay(
      UberRideTrackingModel.fromJson(
        data['uberRideTracking'] as Map<String, dynamic>,
      ),
    );
  }

  @override
  Future<IntegratedTravelHubModel> getIntegratedTravelHub() async {
    final data = await _loadJsonData();
    return _simulateDelay(
      IntegratedTravelHubModel.fromJson(
        data['integratedTravelHub'] as Map<String, dynamic>,
      ),
    );
  }
}
