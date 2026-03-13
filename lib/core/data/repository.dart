import '../models/digital_key_model.dart';
import '../models/loyalty_status_model.dart';
import '../models/transaction_model.dart';
import '../models/user_model.dart';
import '../models/wallet_model.dart';
import 'data_source.dart';

/// Repository that abstracts data source
/// Can switch between mock and API data sources seamlessly
class DataRepository {
  final DataSource _dataSource;

  DataRepository(this._dataSource);

  Future<UserModel> getUser() => _dataSource.getUser();
  Future<WalletModel> getWallet() => _dataSource.getWallet();
  Future<List<TransactionModel>> getTransactions({int limit = 10}) =>
      _dataSource.getTransactions(limit: limit);
  Future<LoyaltyStatusModel> getLoyaltyStatus() => _dataSource.getLoyaltyStatus();
  Future<DigitalKeyModel> getDigitalKey() => _dataSource.getDigitalKey();
}
