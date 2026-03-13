class OrderTrackingModel {
  final String orderId;
  final String title;
  final String status;
  final String eta;
  final String statusEta;

  OrderTrackingModel({
    required this.orderId,
    required this.title,
    required this.status,
    required this.eta,
    required this.statusEta,
  });

  factory OrderTrackingModel.fromJson(Map<String, dynamic> json) =>
      OrderTrackingModel(
        orderId: json['orderId'] as String,
        title: json['title'] as String,
        status: json['status'] as String,
        eta: json['eta'] as String,
        statusEta: json['statusEta'] as String,
      );
}
