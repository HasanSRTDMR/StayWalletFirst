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
  Future<TripBudgetModel> getTripBudget() => _dataSource.getTripBudget();
  Future<List<PostTripExpenseModel>> getPostTripExpenses() =>
      _dataSource.getPostTripExpenses();
  Future<MerchantOffersDataModel> getMerchantOffers() =>
      _dataSource.getMerchantOffers();
  Future<OrderTrackingModel> getOrderTracking() =>
      _dataSource.getOrderTracking();
  Future<UberRideTrackingModel> getUberRideTracking() =>
      _dataSource.getUberRideTracking();
  Future<IntegratedTravelHubModel> getIntegratedTravelHub() =>
      _dataSource.getIntegratedTravelHub();
}
