# StayWallet Ekran Karşılaştırması

## 📊 Özet

- **stay_wallet_screans klasöründe**: 35 ekran
- **Mevcut kodda**: 23 ekran dosyası
- **Router'da tanımlı**: 24 route
- **Eksik ekranlar**: ~12 ekran

---

## 📁 stay_wallet_screans Klasöründeki 35 Ekran

1. ✅ ai_voice_assistant
2. ✅ allianz_insurance_linked_successfully
3. ✅ allianz_travel_insurance_selection
4. ✅ booking.com_linked_successfully
5. ✅ checkout_bill_review
6. ✅ connect_booking.com_account
7. ✅ connect_sixt_account
8. ✅ connect_uber_account
9. ✅ currency_exchange
10. ✅ digital_key_details
11. ✅ e_visa_connectivity
12. ✅ e_visa_linked_successfully
13. ✅ frequent_flyer_management
14. ✅ identity_verification
15. ✅ integrated_travel_hub_1
16. ✅ integrated_travel_hub_2
17. ✅ loyalty_rewards
18. ✅ merchant_offers
19. ✅ ordering_room_service_voice
20. ✅ order_confirmation
21. ✅ order_tracking
22. ✅ passport_scan
23. ✅ post_trip_expense_report
24. ✅ secondary_cardholder_app_view
25. ✅ select_uber_ride
26. ✅ sixt_linked_successfully
27. ✅ smart_card_management
28. ✅ spending_notification
29. ✅ staywallet_dashboard
30. ✅ travel_services_marketplace_1
31. ✅ travel_services_marketplace_2
32. ✅ trip_budgeting
33. ✅ trip_itinerary
34. ✅ uber_linked_successfully
35. ✅ uber_ride_tracking

---

## 🔍 Mevcut Kodda Olan Ekranlar (23 adet)

1. ✅ Dashboard Screen (`staywallet_dashboard`)
2. ✅ Wallet Screen
3. ✅ Currency Exchange Screen (`currency_exchange`)
4. ✅ Smart Card Screen (`smart_card_management`)
5. ✅ Spending Notification Screen (`spending_notification`)
6. ✅ Travel Services Screen (`travel_services_marketplace_1` veya `travel_services_marketplace_2`)
7. ✅ Digital Key Details Screen (`digital_key_details`)
8. ✅ Trip Itinerary Screen (`trip_itinerary`)
9. ✅ Trip Budgeting Screen (`trip_budgeting`)
10. ✅ Uber Ride Tracking Screen (`uber_ride_tracking`)
11. ✅ Frequent Flyer Screen (`frequent_flyer_management`)
12. ✅ E-Visa Screen (`e_visa_connectivity`)
13. ✅ Checkout Bill Screen (`checkout_bill_review`)
14. ✅ Order Confirmation Screen (`order_confirmation`)
15. ✅ Order Tracking Screen (`order_tracking`)
16. ✅ Post Trip Expense Screen (`post_trip_expense_report`)
17. ✅ Connect Account Screen (`connect_booking.com_account`, `connect_sixt_account`, `connect_uber_account`)
18. ✅ Linked Success Screen (`booking.com_linked_successfully`, `sixt_linked_successfully`, `uber_linked_successfully`)
19. ✅ Merchant Offers Screen (`merchant_offers`)
20. ✅ Loyalty Rewards Screen (`loyalty_rewards`)
21. ✅ Profile Screen
22. ✅ Identity Verification Screen (`identity_verification`)
23. ✅ Passport Scan Screen (`passport_scan`)

---

## ❌ Eksik Ekranlar (12 adet)

1. ❌ **AI Voice Assistant** (`ai_voice_assistant`)
2. ❌ **Allianz Insurance Linked Successfully** (`allianz_insurance_linked_successfully`)
3. ❌ **Allianz Travel Insurance Selection** (`allianz_travel_insurance_selection`)
4. ❌ **E-Visa Linked Successfully** (`e_visa_linked_successfully`)
5. ❌ **Integrated Travel Hub 1** (`integrated_travel_hub_1`)
6. ❌ **Integrated Travel Hub 2** (`integrated_travel_hub_2`)
7. ❌ **Ordering Room Service Voice** (`ordering_room_service_voice`)
8. ❌ **Secondary Cardholder App View** (`secondary_cardholder_app_view`)
9. ❌ **Select Uber Ride** (`select_uber_ride`)
10. ❌ **Travel Services Marketplace 1** (`travel_services_marketplace_1`) - Mevcut Travel Services ile farklı olabilir
11. ❌ **Travel Services Marketplace 2** (`travel_services_marketplace_2`) - Mevcut Travel Services ile farklı olabilir
12. ❌ **Wallet Screen** - Mevcut ama `staywallet_dashboard` ile ayrı mı?

---

## 🔄 Eşleşmeler ve Notlar

### Başarılı Eşleşmeler
- `booking.com_linked_successfully` → `LinkedSuccessScreen` (provider parametresi ile)
- `sixt_linked_successfully` → `LinkedSuccessScreen` (provider parametresi ile)
- `uber_linked_successfully` → `LinkedSuccessScreen` (provider parametresi ile)
- `connect_booking.com_account` → `ConnectAccountScreen` (provider parametresi ile)
- `connect_sixt_account` → `ConnectAccountScreen` (provider parametresi ile)
- `connect_uber_account` → `ConnectAccountScreen` (provider parametresi ile)

### Muhtemel Eşleşmeler (Tek ekran, farklı durumlar)
- `travel_services_marketplace_1` ve `travel_services_marketplace_2` → Mevcut `TravelServicesScreen` (farklı durumlar olabilir)
- `integrated_travel_hub_1` ve `integrated_travel_hub_2` → Belki `TravelServicesScreen` ile ilgili?

### Gerçekten Eksik Olanlar
1. **AI Voice Assistant** - Sesli asistan ekranı
2. **Allianz Insurance Selection** - Sigorta seçim ekranı
3. **Allianz Insurance Linked Successfully** - Sigorta bağlantı başarı ekranı
4. **E-Visa Linked Successfully** - E-Visa bağlantı başarı ekranı
5. **Ordering Room Service Voice** - Sesli oda servisi sipariş ekranı
6. **Secondary Cardholder App View** - İkincil kart sahibi görünümü
7. **Select Uber Ride** - Uber yolculuk seçim ekranı
8. **Integrated Travel Hub** - Entegre seyahat merkezi ekranları

---

## 📝 Öneriler

1. Eksik ekranlar için route tanımları eklenmeli
2. Screen dosyaları oluşturulmalı
3. Navigasyon bağlantıları yapılmalı
4. `stay_wallet_screans` klasöründeki HTML dosyaları referans alınarak implementasyon yapılmalı
