class MerchantFilterModel {
  final String id;
  final String label;
  final String icon;

  MerchantFilterModel({
    required this.id,
    required this.label,
    required this.icon,
  });

  factory MerchantFilterModel.fromJson(Map<String, dynamic> json) =>
      MerchantFilterModel(
        id: json['id'] as String,
        label: json['label'] as String,
        icon: json['icon'] as String,
      );
}

class MerchantOfferModel {
  final String id;
  final String title;
  final String subtitle;
  final String discount;
  final String distance;
  final double rating;
  final String imageUrl;

  MerchantOfferModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.discount,
    required this.distance,
    required this.rating,
    required this.imageUrl,
  });

  factory MerchantOfferModel.fromJson(Map<String, dynamic> json) =>
      MerchantOfferModel(
        id: json['id'] as String,
        title: json['title'] as String,
        subtitle: json['subtitle'] as String,
        discount: json['discount'] as String,
        distance: json['distance'] as String,
        rating: (json['rating'] as num).toDouble(),
        imageUrl: json['imageUrl'] as String,
      );
}

class MerchantOffersDataModel {
  final List<MerchantFilterModel> filters;
  final List<MerchantOfferModel> merchants;

  MerchantOffersDataModel({
    required this.filters,
    required this.merchants,
  });

  factory MerchantOffersDataModel.fromJson(Map<String, dynamic> json) =>
      MerchantOffersDataModel(
        filters: (json['filters'] as List<dynamic>)
            .map((e) => MerchantFilterModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        merchants: (json['merchants'] as List<dynamic>)
            .map((e) => MerchantOfferModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
