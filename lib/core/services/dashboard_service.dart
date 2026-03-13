import '../models/digital_key_model.dart';
import '../models/loyalty_status_model.dart';
import '../models/transaction_model.dart';
import '../models/user_model.dart';
import '../models/wallet_model.dart';
import 'app_service.dart';

/// Service for dashboard-related data operations
class DashboardService {
  final _appService = AppService();

  Future<UserModel> getUser() => _appService.repository.getUser();
  Future<WalletModel> getWallet() => _appService.repository.getWallet();
  Future<List<TransactionModel>> getRecentTransactions({int limit = 3}) =>
      _appService.repository.getTransactions(limit: limit);
  Future<LoyaltyStatusModel> getLoyaltyStatus() =>
      _appService.repository.getLoyaltyStatus();
  Future<DigitalKeyModel> getDigitalKey() =>
      _appService.repository.getDigitalKey();
}
