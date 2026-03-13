class TripBudgetCategoryModel {
  final String label;
  final String amount;
  final int percent;

  TripBudgetCategoryModel({
    required this.label,
    required this.amount,
    required this.percent,
  });

  factory TripBudgetCategoryModel.fromJson(Map<String, dynamic> json) =>
      TripBudgetCategoryModel(
        label: json['label'] as String,
        amount: json['amount'] as String,
        percent: (json['percent'] as num).toInt(),
      );
}

class TripBudgetModel {
  final double totalBudget;
  final String currency;
  final double spentAmount;
  final String spentLabel;
  final List<TripBudgetCategoryModel> categories;

  TripBudgetModel({
    required this.totalBudget,
    required this.currency,
    required this.spentAmount,
    required this.spentLabel,
    required this.categories,
  });

  double get progress => totalBudget > 0 ? spentAmount / totalBudget : 0;

  String get totalBudgetFormatted =>
      '${totalBudget.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')} $currency';

  factory TripBudgetModel.fromJson(Map<String, dynamic> json) =>
      TripBudgetModel(
        totalBudget: (json['totalBudget'] as num).toDouble(),
        currency: json['currency'] as String,
        spentAmount: (json['spentAmount'] as num).toDouble(),
        spentLabel: json['spentLabel'] as String,
        categories: (json['categories'] as List<dynamic>)
            .map((e) => TripBudgetCategoryModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
