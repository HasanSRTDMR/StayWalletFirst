import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/digital_key_model.dart';
import '../models/loyalty_status_model.dart';
import '../models/transaction_model.dart';
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
      final String jsonString = await rootBundle.loadString('assets/data/mock_data.json');
      _cachedData = json.decode(jsonString) as Map<String, dynamic>;
      return _cachedData!;
    } catch (e) {
      throw Exception('Failed to load mock data: $e');
    }
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
}
