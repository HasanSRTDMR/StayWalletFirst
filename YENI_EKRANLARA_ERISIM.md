# Yeni Ekranlara Erişim Rehberi

Bu dokümantasyon, yeni oluşturulan ekranlara nasıl ulaşılacağını açıklar.

## 📱 Yeni Ekranlar ve Erişim Yolları

### 1. 🤖 AI Voice Assistant
**Route**: `/ai/voice-assistant`

**Erişim Yolları**:
- **Dashboard** → Sağ üst köşedeki mikrofon (🎤) ikonuna tıklayın

**Özellikler**:
- Sesli asistan arayüzü
- Animasyonlu waveform görselleştirme
- Önerilen aksiyonlar (Book Mirage Grill, Check balance, Unlock room, Find tours)

---

### 2. 🏥 Allianz Travel Insurance Selection
**Route**: `/integrations/allianz-travel-insurance-selection`

**Erişim Yolları**:
- **Travel Services** → "Travel Insurance" kategorisine tıklayın

**Özellikler**:
- 3 farklı sigorta planı (Basic, Premium, Elite)
- Plan karşılaştırma
- Fiyatlandırma bilgileri

---

### 3. ✅ Allianz Insurance Linked Successfully
**Route**: `/integrations/allianz-insurance-linked-success`

**Erişim Yolları**:
- **Allianz Travel Insurance Selection** → Bir plan seçip "Select Premium Plan" butonuna tıklayın

**Özellikler**:
- Sigorta bağlantı başarı mesajı
- Policy detayları
- StayWallet Rewards bilgisi
- Acil durum iletişim butonu

---

### 4. ✅ E-Visa Linked Successfully
**Route**: `/integrations/e-visa-linked-success`

**Erişim Yolları**:
- **E-Visa Screen** → Herhangi bir ülkeye tıklayın

**Özellikler**:
- E-Visa bağlantı başarı mesajı
- Bağlı bölgeler ve ülkeler listesi
- Tüm belgeleri görüntüleme butonu

---

### 5. 🎤 Ordering Room Service Voice
**Route**: `/travel/ordering-room-service-voice`

**Erişim Yolları**:
- **Dashboard** → Quick Actions → "Room Service" butonuna tıklayın

**Özellikler**:
- Sesli oda servisi sipariş ekranı
- Canlı ses işleme görselleştirmesi
- Tanımlanan ürünlerin gösterimi (Wagyu Burger, Coca Cola)

---

### 6. 👥 Secondary Cardholder App View
**Route**: `/wallet/secondary-cardholder-app-view`

**Erişim Yolları**:
- **Profile** → "Secondary Cardholder" seçeneğine tıklayın

**Özellikler**:
- İkincil kart sahibi (Sarah Walker) görünümü
- Dijital anahtar erişimi (Room 402)
- Bakiye ve günlük limit bilgileri
- Son işlemler listesi

---

### 7. 🚗 Select Uber Ride
**Route**: `/travel/select-uber-ride`

**Erişim Yolları**:
- **Travel Services** → "Rental Car" kategorisine tıklayın
- **Uber Ride Tracking** → "Book Another Ride" butonuna tıklayın

**Özellikler**:
- Harita görünümü
- Mevcut konum ve hedef gösterimi
- Farklı Uber seçenekleri (UberX, Uber Comfort, UberXL)
- Fiyat ve tahmini varış süresi bilgileri

---

### 8. 🌐 Integrated Travel Hub
**Route**: `/travel/integrated-travel-hub`

**Erişim Yolları**:
- Bu ekran şu anda doğrudan erişilebilir değil, ancak router'da tanımlı
- Gelecekte Travel Services'den veya başka bir yerden erişilebilir hale getirilebilir

**Özellikler**:
- Bağlı hesaplar görünümü
- Frequent Flyer Program bilgileri
- Partner kategorileri
- E-Visa servisleri

---

## 🔗 Navigasyon Akış Diyagramı

```
Dashboard
├── 🎤 Mikrofon İkonu → AI Voice Assistant
└── Quick Actions → Room Service → Ordering Room Service Voice

Travel Services
├── Travel Insurance → Allianz Travel Insurance Selection
│   └── Plan Seçimi → Allianz Insurance Linked Successfully
├── Rental Car → Select Uber Ride
└── E-Visa Services → E-Visa Screen
    └── Ülke Seçimi → E-Visa Linked Successfully

Profile
└── Secondary Cardholder → Secondary Cardholder App View

Uber Ride Tracking
└── Book Another Ride → Select Uber Ride
```

---

## 📝 Notlar

- Tüm yeni ekranlar router'da tanımlı ve çalışır durumda
- Transition animasyonları eklendi (slide transitions)
- Tüm ekranlar mevcut tasarım sistemiyle uyumlu
- Linter hatası yok

---

## 🧪 Test Etmek İçin

1. Uygulamayı çalıştırın
2. Dashboard'a gidin
3. Sağ üstteki mikrofon ikonuna tıklayarak AI Voice Assistant'ı açın
4. Travel Services'e gidip farklı kategorilere tıklayın
5. Profile'dan Secondary Cardholder'a erişin

---

**Güncelleme Tarihi**: 12 Mart 2026
