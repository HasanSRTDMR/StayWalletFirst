import '../models/transaction_model.dart';
import '../models/wallet_model.dart';
import 'app_service.dart';

/// Service for wallet-related data operations
class WalletService {
  final _appService = AppService();

  Future<WalletModel> getWallet() => _appService.repository.getWallet();
  Future<List<TransactionModel>> getTransactions({int limit = 10}) =>
      _appService.repository.getTransactions(limit: limit);
}
