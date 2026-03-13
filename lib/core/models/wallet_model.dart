class WalletModel {
  final String id;
  final double primaryBalance; // AED
  final String primaryCurrency;
  final Map<String, double> otherBalances; // USD, EUR, etc.
  final DateTime lastUpdated;

  WalletModel({
    required this.id,
    required this.primaryBalance,
    this.primaryCurrency = 'AED',
    Map<String, double>? otherBalances,
    DateTime? lastUpdated,
  })  : otherBalances = otherBalances ?? {},
        lastUpdated = lastUpdated ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'primaryBalance': primaryBalance,
        'primaryCurrency': primaryCurrency,
        'otherBalances': otherBalances,
        'lastUpdated': lastUpdated.toIso8601String(),
      };

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
        id: json['id'] as String,
        primaryBalance: (json['primaryBalance'] as num).toDouble(),
        primaryCurrency: json['primaryCurrency'] as String? ?? 'AED',
        otherBalances: Map<String, double>.from(
          (json['otherBalances'] as Map?)?.map(
                (k, v) => MapEntry(k as String, (v as num).toDouble()),
              ) ??
              {},
        ),
        lastUpdated: json['lastUpdated'] != null
            ? DateTime.parse(json['lastUpdated'] as String)
            : DateTime.now(),
      );
}
