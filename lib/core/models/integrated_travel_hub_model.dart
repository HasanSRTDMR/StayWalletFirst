class TravelHubConnectedAccountModel {
  final String label;
  final String sublabel;
  final String colorHex;

  TravelHubConnectedAccountModel({
    required this.label,
    required this.sublabel,
    required this.colorHex,
  });

  factory TravelHubConnectedAccountModel.fromJson(Map<String, dynamic> json) =>
      TravelHubConnectedAccountModel(
        label: json['label'] as String,
        sublabel: json['sublabel'] as String,
        colorHex: json['colorHex'] as String,
      );
}

class TravelHubFrequentFlyerModel {
  final String label;
  final String points;
  final String colorHex;

  TravelHubFrequentFlyerModel({
    required this.label,
    required this.points,
    required this.colorHex,
  });

  factory TravelHubFrequentFlyerModel.fromJson(Map<String, dynamic> json) =>
      TravelHubFrequentFlyerModel(
        label: json['label'] as String,
        points: json['points'] as String,
        colorHex: json['colorHex'] as String,
      );
}

class TravelHubCategoryModel {
  final String icon;
  final String title;
  final String subtitle;
  final String colorHex;

  TravelHubCategoryModel({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.colorHex,
  });

  factory TravelHubCategoryModel.fromJson(Map<String, dynamic> json) =>
      TravelHubCategoryModel(
        icon: json['icon'] as String,
        title: json['title'] as String,
        subtitle: json['subtitle'] as String,
        colorHex: json['colorHex'] as String,
      );
}

class IntegratedTravelHubModel {
  final List<TravelHubConnectedAccountModel> connectedAccounts;
  final List<TravelHubFrequentFlyerModel> frequentFlyerPrograms;
  final List<TravelHubCategoryModel> categories;

  IntegratedTravelHubModel({
    required this.connectedAccounts,
    required this.frequentFlyerPrograms,
    required this.categories,
  });

  factory IntegratedTravelHubModel.fromJson(Map<String, dynamic> json) =>
      IntegratedTravelHubModel(
        connectedAccounts: (json['connectedAccounts'] as List<dynamic>)
            .map((e) =>
                TravelHubConnectedAccountModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        frequentFlyerPrograms: (json['frequentFlyerPrograms'] as List<dynamic>)
            .map((e) =>
                TravelHubFrequentFlyerModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        categories: (json['categories'] as List<dynamic>)
            .map((e) =>
                TravelHubCategoryModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
