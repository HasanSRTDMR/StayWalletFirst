enum TransactionType { expense, income }

class TransactionModel {
  final String id;
  final String title;
  final String amount;
  final String subtitle;
  final TransactionType type;
  final DateTime timestamp;
  final String? trailingText;
  final String? badge;
  final String iconName;

  TransactionModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.subtitle,
    required this.type,
    required this.timestamp,
    this.trailingText,
    this.badge,
    this.iconName = 'dinner_dining',
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'amount': amount,
        'subtitle': subtitle,
        'type': type.name,
        'timestamp': timestamp.toIso8601String(),
        'trailingText': trailingText,
        'badge': badge,
        'iconName': iconName,
      };

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json['id'] as String,
        title: json['title'] as String,
        amount: json['amount'] as String,
        subtitle: json['subtitle'] as String,
        type: TransactionType.values.firstWhere(
          (e) => e.name == json['type'],
          orElse: () => TransactionType.expense,
        ),
        timestamp: DateTime.parse(json['timestamp'] as String),
        trailingText: json['trailingText'] as String?,
        badge: json['badge'] as String?,
        iconName: json['iconName'] as String? ?? 'dinner_dining',
      );
}
