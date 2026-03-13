import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
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

/// Real API data source
/// Replace the baseUrl with your actual API endpoint
class ApiDataSource implements DataSource {
  final String baseUrl;
  final http.Client client;
  final Duration timeout;

  ApiDataSource({
    required this.baseUrl,
    http.Client? client,
    this.timeout = const Duration(seconds: 30),
  }) : client = client ?? http.Client();

  Future<Map<String, dynamic>> _get(String endpoint) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    final response = await client
        .get(uri)
        .timeout(timeout, onTimeout: () => throw TimeoutException('Request timeout'));

    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  Future<List<dynamic>> _getList(String endpoint) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    final response = await client
        .get(uri)
        .timeout(timeout, onTimeout: () => throw TimeoutException('Request timeout'));

    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  @override
  Future<UserModel> getUser() async {
    final data = await _get('/api/user');
    return UserModel.fromJson(data);
  }

  @override
  Future<WalletModel> getWallet() async {
    final data = await _get('/api/wallet');
    return WalletModel.fromJson(data);
  }

  @override
  Future<List<TransactionModel>> getTransactions({int limit = 10}) async {
    final data = await _getList('/api/transactions?limit=$limit');
    return data
        .map((json) => TransactionModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<LoyaltyStatusModel> getLoyaltyStatus() async {
    final data = await _get('/api/loyalty/status');
    return LoyaltyStatusModel.fromJson(data);
  }

  @override
  Future<DigitalKeyModel> getDigitalKey() async {
    final data = await _get('/api/digital-key');
    return DigitalKeyModel.fromJson(data);
  }

  @override
  Future<TripBudgetModel> getTripBudget() async {
    try {
      final data = await _get('/api/trip-budget');
      return TripBudgetModel.fromJson(data);
    } catch (_) {
      return TripBudgetModel.fromJson(_tripBudgetFallback);
    }
  }

  @override
  Future<List<PostTripExpenseModel>> getPostTripExpenses() async {
    try {
      final data = await _getList('/api/post-trip-expenses');
      return data.map((e) => PostTripExpenseModel.fromJson(e as Map<String, dynamic>)).toList();
    } catch (_) {
      return [PostTripExpenseModel.fromJson(_postTripExpensesFallback[0])];
    }
  }

  @override
  Future<MerchantOffersDataModel> getMerchantOffers() async {
    try {
      final data = await _get('/api/merchant-offers');
      return MerchantOffersDataModel.fromJson(data);
    } catch (_) {
      return MerchantOffersDataModel.fromJson(_merchantOffersFallback);
    }
  }

  @override
  Future<OrderTrackingModel> getOrderTracking() async {
    try {
      final data = await _get('/api/order-tracking');
      return OrderTrackingModel.fromJson(data);
    } catch (_) {
      return OrderTrackingModel.fromJson(_orderTrackingFallback);
    }
  }

  @override
  Future<UberRideTrackingModel> getUberRideTracking() async {
    try {
      final data = await _get('/api/uber-ride-tracking');
      return UberRideTrackingModel.fromJson(data);
    } catch (_) {
      return UberRideTrackingModel.fromJson(_uberRideTrackingFallback);
    }
  }

  @override
  Future<IntegratedTravelHubModel> getIntegratedTravelHub() async {
    try {
      final data = await _get('/api/integrated-travel-hub');
      return IntegratedTravelHubModel.fromJson(data);
    } catch (_) {
      return IntegratedTravelHubModel.fromJson(_integratedTravelHubFallback);
    }
  }

  static final _tripBudgetFallback = {
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
  };
  static final _postTripExpensesFallback = [
    {'id': 'exp_001', 'name': 'Dubai Trip - Dec 2024', 'totalExpenses': '2,450 AED', 'currency': 'AED'},
  ];
  static final _merchantOffersFallback = {
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
  };
  static final _orderTrackingFallback = {
    'orderId': '#4521',
    'title': 'Room Service - Order #4521',
    'status': 'Preparing',
    'eta': 'ETA 25 min',
    'statusEta': 'Preparing • ETA 25 min',
  };
  static final _uberRideTrackingFallback = {
    'rideType': 'UberX',
    'carModel': 'Toyota Camry • ABC 123',
    'pickup': 'Grand Mirage Dubai',
    'destination': 'Dubai Mall',
    'eta': '8 min',
  };
  static final _integratedTravelHubFallback = {
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
  };
}
