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

/// Abstract interface for data sources
/// This allows switching between mock and real API data sources
abstract class DataSource {
  Future<UserModel> getUser();
  Future<WalletModel> getWallet();
  Future<List<TransactionModel>> getTransactions({int limit = 10});
  Future<LoyaltyStatusModel> getLoyaltyStatus();
  Future<DigitalKeyModel> getDigitalKey();
  Future<TripBudgetModel> getTripBudget();
  Future<List<PostTripExpenseModel>> getPostTripExpenses();
  Future<MerchantOffersDataModel> getMerchantOffers();
  Future<OrderTrackingModel> getOrderTracking();
  Future<UberRideTrackingModel> getUberRideTracking();
  Future<IntegratedTravelHubModel> getIntegratedTravelHub();
}
