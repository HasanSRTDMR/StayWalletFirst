# Data Layer Architecture

Bu klasör, StayWallet uygulamasının veri katmanını içerir. Mock ve gerçek API veri kaynakları arasında kolayca geçiş yapabilmenizi sağlar.

## Yapı

- **data_source.dart**: Tüm veri kaynakları için abstract interface
- **mock_data_source.dart**: Fake veriler döndüren mock implementasyon
- **api_data_source.dart**: Gerçek API'den veri çeken implementasyon
- **repository.dart**: Veri kaynaklarını yöneten repository pattern

## Kullanım

### Mock Data ile Başlatma (Varsayılan)

Uygulama varsayılan olarak mock data ile başlar:

```dart
void main() {
  AppService().initializeWithMock();
  runApp(const StayWalletApp());
}
```

### API ile Başlatma

Gerçek API'yi kullanmak için:

```dart
void main() {
  AppService().initializeWithApi('https://api.staywallet.com');
  runApp(const StayWalletApp());
}
```

### Runtime'da Geçiş

Uygulama çalışırken mock ve API arasında geçiş yapabilirsiniz:

```dart
// Mock'a geç
AppService().switchToMock();

// API'ye geç
AppService().switchToApi('https://api.staywallet.com');
```

## API Endpoint'leri

Gerçek API'niz şu endpoint'leri sağlamalıdır:

- `GET /api/user` - Kullanıcı bilgileri
- `GET /api/wallet` - Cüzdan bakiyesi
- `GET /api/transactions?limit=10` - İşlem geçmişi
- `GET /api/loyalty/status` - Loyalty durumu
- `GET /api/digital-key` - Dijital anahtar bilgileri

## Veri Modelleri

Tüm modeller `lib/core/models/` klasöründe bulunur:
- `user_model.dart`
- `wallet_model.dart`
- `transaction_model.dart`
- `loyalty_status_model.dart`
- `digital_key_model.dart`
