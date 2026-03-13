# API Kullanım Rehberi

Bu dokümantasyon, StayWallet uygulamasında mock ve gerçek API verileri arasında nasıl geçiş yapılacağını açıklar.

## 🎯 Özellikler

✅ **Mock Data**: API hazır olmadan önce fake verilerle çalışma  
✅ **API Integration**: Gerçek API'yi kolayca bağlama  
✅ **Kolay Geçiş**: Tek satır kodla mock ve API arasında geçiş  
✅ **Otomatik Yükleme**: Veriler otomatik olarak API'den gelir gibi yüklenir  

## 📋 Kurulum

### 1. Paketler Yüklendi

`http` paketi `pubspec.yaml` dosyasına eklendi ve yüklendi.

### 2. Mock Data ile Başlatma (Varsayılan)

Uygulama şu anda mock data ile çalışıyor. `lib/main.dart` dosyasında:

```dart
void main() {
  // Mock data ile başlatılıyor (varsayılan)
  AppService().initializeWithMock();
  
  runApp(const StayWalletApp());
}
```

## 🔄 API'ye Geçiş

### Yöntem 1: main.dart'ta Değiştirme

`lib/main.dart` dosyasını açın ve şu şekilde değiştirin:

```dart
void main() {
  // Gerçek API'yi kullan
  AppService().initializeWithApi('https://api.staywallet.com');
  
  runApp(const StayWalletApp());
}
```

### Yöntem 2: Runtime'da Geçiş

Uygulama çalışırken de geçiş yapabilirsiniz:

```dart
// Mock'a geç
AppService().switchToMock();

// API'ye geç
AppService().switchToApi('https://api.staywallet.com');
```

## 📡 API Endpoint'leri

Gerçek API'niz şu endpoint'leri sağlamalıdır:

### 1. Kullanıcı Bilgileri
```
GET /api/user
```

**Response:**
```json
{
  "id": "user_001",
  "firstName": "Mr.",
  "lastName": "Alexander",
  "email": "alexander@example.com",
  "profileImageUrl": null
}
```

### 2. Cüzdan Bakiyesi
```
GET /api/wallet
```

**Response:**
```json
{
  "id": "wallet_001",
  "primaryBalance": 1250.00,
  "primaryCurrency": "AED",
  "otherBalances": {
    "USD": 340.50,
    "EUR": 312.00
  },
  "lastUpdated": "2026-03-13T10:00:00Z"
}
```

### 3. İşlem Geçmişi
```
GET /api/transactions?limit=10
```

**Response:**
```json
[
  {
    "id": "txn_001",
    "title": "Mirage Grill & Lounge",
    "amount": "- 245.00 AED",
    "subtitle": "Hotel Restaurant",
    "type": "expense",
    "timestamp": "2026-03-13T08:00:00Z",
    "trailingText": "15% Discount Applied",
    "iconName": "dinner_dining"
  }
]
```

### 4. Loyalty Durumu
```
GET /api/loyalty/status
```

**Response:**
```json
{
  "tier": "Gold Status",
  "currentPoints": 850,
  "nextTierPoints": 1000,
  "nextTier": "Diamond Status",
  "message": "150 points until your next luxury reward"
}
```

### 5. Dijital Anahtar
```
GET /api/digital-key
```

**Response:**
```json
{
  "id": "key_001",
  "hotelName": "Grand Mirage Dubai",
  "roomInfo": "Room 402 • Deluxe Suite",
  "roomNumber": "402",
  "roomType": "Deluxe Suite",
  "isActive": true,
  "imageUrl": "https://...",
  "checkInDate": "2026-03-11T14:00:00Z",
  "checkOutDate": "2026-03-18T11:00:00Z"
}
```

## 🎨 Kullanılan Ekranlar

Aşağıdaki ekranlar yeni servisleri kullanıyor:

- ✅ **Dashboard Screen**: Kullanıcı bilgileri, wallet, loyalty status, digital key ve transactions
- ✅ **Wallet Screen**: Wallet bakiyesi ve transaction geçmişi

## 🔍 Kontrol Etme

Hangi veri kaynağının kullanıldığını kontrol etmek için:

```dart
final appService = AppService();
print('Using API: ${appService.isUsingApi}');
print('API URL: ${appService.apiBaseUrl}');
```

## 📝 Notlar

1. **Mock Data**: Mock data source yaklaşık 500ms gecikme simüle eder (gerçek API gibi)
2. **Error Handling**: API hataları ekranlarda gösterilir
3. **Refresh**: Pull-to-refresh ile veriler yenilenebilir
4. **Loading States**: Veriler yüklenirken loading indicator gösterilir

## 🚀 Sonraki Adımlar

1. API endpoint'lerinizi hazırlayın
2. `main.dart` dosyasında API URL'ini güncelleyin
3. Test edin!
