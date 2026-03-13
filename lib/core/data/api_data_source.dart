import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/digital_key_model.dart';
import '../models/loyalty_status_model.dart';
import '../models/transaction_model.dart';
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
}
