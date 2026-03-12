# StayWallet Navigasyon Dokümantasyonu

Bu dokümantasyon, StayWallet projesindeki tüm ekran geçişlerini ve navigasyon akışlarını açıklar.

## 📋 İçindekiler
- [Navigasyon Yapısı](#navigasyon-yapısı)
- [Ana Navigasyon (Bottom Navigation)](#ana-navigasyon-bottom-navigation)
- [Ekranlar ve Navigasyon Akışları](#ekranlar-ve-navigasyon-akışları)
- [Route Tanımları](#route-tanımları)

---

## Navigasyon Yapısı

Proje **GoRouter** kullanarak navigasyon yönetimi yapmaktadır. Router yapılandırması `lib/core/router/app_router.dart` dosyasında bulunmaktadır.

### İki Tip Route Yapısı

1. **ShellRoute (Bottom Navigation ile)**: Ana ekranlar bottom navigation bar ile erişilebilir
2. **Full-Screen Routes**: Bottom navigation bar olmadan tam ekran gösterilen sayfalar

---

## Ana Navigasyon (Bottom Navigation)

Aşağıdaki 5 ekran bottom navigation bar üzerinden erişilebilir:

| Index | Ekran | Route | Dosya Yolu |
|-------|-------|-------|------------|
| 0 | Dashboard | `/` | `lib/features/dashboard/presentation/screens/dashboard_screen.dart` |
| 1 | Wallet | `/wallet` | `lib/features/wallet/presentation/screens/wallet_screen.dart` |
| 2 | Digital Key | `/key` | `lib/features/travel/presentation/screens/digital_key_details_screen.dart` |
| 3 | Travel Services | `/services` | `lib/features/travel/presentation/screens/travel_services_screen.dart` |
| 4 | Profile | `/profile` | `lib/features/marketplace/presentation/screens/profile_screen.dart` |

**Navigasyon Kontrolü**: `lib/widgets/scaffold_with_nav.dart` dosyasında bottom navigation bar yönetimi yapılmaktadır.

---

## Ekranlar ve Navigasyon Akışları

### 🏠 Dashboard Screen (`/`)

**Dosya**: `lib/features/dashboard/presentation/screens/dashboard_screen.dart`

**Bu ekrandan gidilen yerler:**

| Aksiyon | Hedef Ekran | Route | Metod |
|---------|-------------|-------|-------|
| Digital Key Card → Unlock butonu | Digital Key Details | `/travel/digital-key-details` | `context.push()` |
| Wallet Section → Manage butonu | Wallet | `/wallet` | `context.push()` |
| Wallet Section → Top Up butonu | Currency Exchange | `/wallet/currency-exchange` | `context.push()` |

**Not**: Quick Actions bölümündeki butonlar (Book Spa, Room Service, View Tours, Check-out) henüz implement edilmemiş.

---

### 💰 Wallet Screen (`/wallet`)

**Dosya**: `lib/features/wallet/presentation/screens/wallet_screen.dart`

**Bu ekrandan gidilen yerler:**

| Aksiyon | Hedef Ekran | Route | Metod |
|---------|-------------|-------|-------|
| Recent Transactions → Currency Exchange | Currency Exchange | `/wallet/currency-exchange` | `context.push()` |
| Recent Transactions → Smart Card | Smart Card | `/wallet/smart-card` | `context.push()` |
| Recent Transactions → Spending Alerts | Spending Notification | `/wallet/spending-notification` | `context.push()` |
| Balance Card → Top Up butonu | Currency Exchange | `/wallet/currency-exchange` | `context.push()` |
| Quick Actions → Exchange | Currency Exchange | `/wallet/currency-exchange` | `context.push()` |
| Quick Actions → Cards | Smart Card | `/wallet/smart-card` | `context.push()` |

---

### 🔑 Digital Key Details Screen (`/key` ve `/travel/digital-key-details`)

**Dosya**: `lib/features/travel/presentation/screens/digital_key_details_screen.dart`

**Bu ekrandan gidilen yerler:**

| Aksiyon | Hedef Ekran | Route | Metod |
|---------|-------------|-------|-------|
| Activate Digital Key butonu | Identity Verification | `/identity/verification` | `context.go()` |

**Not**: Bu ekran hem bottom navigation'dan (`/key`) hem de full-screen route (`/travel/digital-key-details`) olarak erişilebilir.

---

### ✈️ Travel Services Screen (`/services`)

**Dosya**: `lib/features/travel/presentation/screens/travel_services_screen.dart`

**Bu ekrandan gidilen yerler:**

| Aksiyon | Hedef Ekran | Route | Metod |
|---------|-------------|-------|-------|
| Connected Account → Booking.com | Connect Account (booking) | `/integrations/connect/booking` | `context.push()` |
| Connected Account → Sixt | Connect Account (sixt) | `/integrations/connect/sixt` | `context.push()` |
| Connected Account → Allianz | Connect Account (allianz) | `/integrations/connect/allianz` | `context.push()` |
| Partner Categories → E-Visa Services | E-Visa | `/integrations/e-visa` | `context.push()` |

---

### 👤 Profile Screen (`/profile`)

**Dosya**: `lib/features/marketplace/presentation/screens/profile_screen.dart`

**Bu ekrandan gidilen yerler:**

| Aksiyon | Hedef Ekran | Route | Metod |
|---------|-------------|-------|-------|
| Loyalty & Rewards | Loyalty Rewards | `/marketplace/loyalty-rewards` | `context.push()` |
| Smart Card Management | Smart Card | `/wallet/smart-card` | `context.push()` |
| Identity Verification | Identity Verification | `/identity/verification` | `context.push()` |
| Notifications | Spending Notification | `/wallet/spending-notification` | `context.push()` |

---

### 🔗 Connect Account Screen (`/integrations/connect/:provider`)

**Dosya**: `lib/features/integrations/presentation/screens/connect_account_screen.dart`

**Parametreler**: `provider` (booking, sixt, uber, allianz)

**Bu ekrandan gidilen yerler:**

| Aksiyon | Hedef Ekran | Route | Metod |
|---------|-------------|-------|-------|
| Connect Account butonu | Linked Success | `/integrations/linked-success/:provider` | `context.go()` |

---

### ✅ Linked Success Screen (`/integrations/linked-success/:provider`)

**Dosya**: `lib/features/integrations/presentation/screens/linked_success_screen.dart`

**Parametreler**: `provider` (booking, sixt, uber, allianz)

**Bu ekrandan gidilen yerler:**

| Aksiyon | Hedef Ekran | Route | Metod |
|---------|-------------|-------|-------|
| Continue to Dashboard butonu | Dashboard | `/` | `context.go()` |

---

## Full-Screen Routes (Bottom Navigation Yok)

Aşağıdaki ekranlar bottom navigation bar olmadan tam ekran gösterilir:

### Para ve Cüzdan İşlemleri

| Ekran | Route | Dosya Yolu |
|-------|-------|------------|
| Currency Exchange | `/wallet/currency-exchange` | `lib/features/wallet/presentation/screens/currency_exchange_screen.dart` |
| Smart Card | `/wallet/smart-card` | `lib/features/wallet/presentation/screens/smart_card_screen.dart` |
| Spending Notification | `/wallet/spending-notification` | `lib/features/wallet/presentation/screens/spending_notification_screen.dart` |

### Seyahat ve Entegrasyonlar

| Ekran | Route | Dosya Yolu |
|-------|-------|------------|
| Digital Key Details | `/travel/digital-key-details` | `lib/features/travel/presentation/screens/digital_key_details_screen.dart` |
| Trip Itinerary | `/travel/trip-itinerary` | `lib/features/travel/presentation/screens/trip_itinerary_screen.dart` |
| Trip Budgeting | `/travel/trip-budgeting` | `lib/features/travel/presentation/screens/trip_budgeting_screen.dart` |
| Uber Ride Tracking | `/travel/uber-tracking` | `lib/features/travel/presentation/screens/uber_ride_tracking_screen.dart` |
| Checkout Bill | `/travel/checkout-bill` | `lib/features/travel/presentation/screens/checkout_bill_screen.dart` |
| Order Confirmation | `/travel/order-confirmation` | `lib/features/travel/presentation/screens/order_confirmation_screen.dart` |
| Order Tracking | `/travel/order-tracking` | `lib/features/travel/presentation/screens/order_tracking_screen.dart` |
| Post Trip Expense | `/travel/post-trip-expense` | `lib/features/travel/presentation/screens/post_trip_expense_screen.dart` |
| Frequent Flyer | `/integrations/frequent-flyer` | `lib/features/travel/presentation/screens/frequent_flyer_screen.dart` |
| E-Visa | `/integrations/e-visa` | `lib/features/travel/presentation/screens/e_visa_screen.dart` |

### Marketplace ve Kimlik

| Ekran | Route | Dosya Yolu |
|-------|-------|------------|
| Merchant Offers | `/marketplace/merchant-offers` | `lib/features/marketplace/presentation/screens/merchant_offers_screen.dart` |
| Loyalty Rewards | `/marketplace/loyalty-rewards` | `lib/features/marketplace/presentation/screens/loyalty_rewards_screen.dart` |
| Identity Verification | `/identity/verification` | `lib/features/identity/presentation/screens/identity_verification_screen.dart` |
| Passport Scan | `/identity/passport-scan` | `lib/features/identity/presentation/screens/passport_scan_screen.dart` |

---

## Route Tanımları

Tüm route'lar `lib/core/router/app_router.dart` dosyasındaki `AppRoutes` sınıfında tanımlanmıştır:

```dart
class AppRoutes {
  // Ana Ekranlar (Bottom Nav)
  static const String dashboard = '/';
  static const String wallet = '/wallet';
  static const String digitalKey = '/key';
  static const String services = '/services';
  static const String profile = '/profile';
  
  // Wallet İşlemleri
  static const String currencyExchange = '/wallet/currency-exchange';
  static const String smartCard = '/wallet/smart-card';
  static const String spendingNotification = '/wallet/spending-notification';
  
  // Travel İşlemleri
  static const String digitalKeyDetails = '/travel/digital-key-details';
  static const String tripItinerary = '/travel/trip-itinerary';
  static const String tripBudgeting = '/travel/trip-budgeting';
  static const String uberRideTracking = '/travel/uber-tracking';
  static const String checkoutBill = '/travel/checkout-bill';
  static const String orderConfirmation = '/travel/order-confirmation';
  static const String orderTracking = '/travel/order-tracking';
  static const String postTripExpense = '/travel/post-trip-expense';
  
  // Integrations
  static const String connectAccount = '/integrations/connect';
  static const String linkedSuccess = '/integrations/linked-success';
  static const String frequentFlyer = '/integrations/frequent-flyer';
  static const String eVisa = '/integrations/e-visa';
  
  // Marketplace
  static const String merchantOffers = '/marketplace/merchant-offers';
  static const String loyaltyRewards = '/marketplace/loyalty-rewards';
  
  // Identity
  static const String identityVerification = '/identity/verification';
  static const String passportScan = '/identity/passport-scan';
}
```

---

## Navigasyon Metodları

### `context.push()`
- Yeni bir ekranı stack'e ekler
- Geri butonu ile önceki ekrana dönülebilir
- Genellikle detay sayfaları için kullanılır

### `context.go()`
- Mevcut route'u değiştirir
- Stack'i temizler veya yeni bir route'a geçer
- Genellikle ana navigasyon ve başarı ekranlarından sonra kullanılır

### `context.pop()`
- Önceki ekrana geri döner
- Stack'ten bir ekranı kaldırır

---

## Navigasyon Akış Diyagramı

```
Dashboard (/)
├── Digital Key Details → Identity Verification
├── Wallet → Currency Exchange, Smart Card, Spending Notification
└── Currency Exchange

Wallet (/wallet)
├── Currency Exchange
├── Smart Card
└── Spending Notification

Digital Key (/key)
└── Identity Verification

Travel Services (/services)
├── Connect Account (booking/sixt/allianz) → Linked Success → Dashboard
└── E-Visa

Profile (/profile)
├── Loyalty Rewards
├── Smart Card
├── Identity Verification
└── Spending Notification
```

---

## Önemli Notlar

1. **Bottom Navigation**: Sadece 5 ana ekran bottom navigation bar'da görünür (Dashboard, Wallet, Digital Key, Travel Services, Profile)

2. **Full-Screen Routes**: Diğer tüm ekranlar bottom navigation bar olmadan gösterilir

3. **Parametreli Routes**: 
   - `/integrations/connect/:provider` - provider parametresi alır
   - `/integrations/linked-success/:provider` - provider parametresi alır

4. **Transition Animasyonları**: Full-screen route'lar slide transition animasyonu kullanır (sağdan sola)

5. **Initial Route**: Uygulama açıldığında `/` (Dashboard) ekranı gösterilir

---

## Güncelleme Tarihi

Bu dokümantasyon **12 Mart 2026** tarihinde oluşturulmuştur.
