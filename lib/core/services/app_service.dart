import '../data/api_data_source.dart';
import '../data/data_source.dart';
import '../data/mock_data_source.dart';
import '../data/repository.dart';

/// Application service that manages data sources
/// By default uses mock data, but can be switched to API easily
class AppService {
  static final AppService _instance = AppService._internal();
  factory AppService() => _instance;
  AppService._internal();

  DataRepository? _repository;
  bool _useApi = false;
  String? _apiBaseUrl;

  /// Initialize with mock data (default)
  void initializeWithMock() {
    _useApi = false;
    _repository = DataRepository(MockDataSource());
  }

  /// Initialize with real API
  /// [baseUrl] - Your API base URL (e.g., 'https://api.staywallet.com')
  void initializeWithApi(String baseUrl) {
    _useApi = true;
    _apiBaseUrl = baseUrl;
    _repository = DataRepository(ApiDataSource(baseUrl: baseUrl));
  }

  /// Switch between mock and API at runtime
  void switchToMock() {
    initializeWithMock();
  }

  void switchToApi(String baseUrl) {
    initializeWithApi(baseUrl);
  }

  /// Get the current repository
  DataRepository get repository {
    if (_repository == null) {
      // Default to mock if not initialized
      initializeWithMock();
    }
    return _repository!;
  }

  /// Check if currently using API
  bool get isUsingApi => _useApi;

  /// Get current API base URL (null if using mock)
  String? get apiBaseUrl => _apiBaseUrl;
}
