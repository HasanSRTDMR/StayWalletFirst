class PostTripExpenseModel {
  final String id;
  final String name;
  final String totalExpenses;
  final String currency;

  PostTripExpenseModel({
    required this.id,
    required this.name,
    required this.totalExpenses,
    required this.currency,
  });

  factory PostTripExpenseModel.fromJson(Map<String, dynamic> json) =>
      PostTripExpenseModel(
        id: json['id'] as String,
        name: json['name'] as String,
        totalExpenses: json['totalExpenses'] as String,
        currency: json['currency'] as String,
      );
}
