import '../models/digital_key_model.dart';
import '../models/loyalty_status_model.dart';
import '../models/transaction_model.dart';
import '../models/user_model.dart';
import '../models/wallet_model.dart';

/// Abstract interface for data sources
/// This allows switching between mock and real API data sources
abstract class DataSource {
  Future<UserModel> getUser();
  Future<WalletModel> getWallet();
  Future<List<TransactionModel>> getTransactions({int limit = 10});
  Future<LoyaltyStatusModel> getLoyaltyStatus();
  Future<DigitalKeyModel> getDigitalKey();
}
