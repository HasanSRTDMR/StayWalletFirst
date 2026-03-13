class UberRideTrackingModel {
  final String rideType;
  final String carModel;
  final String pickup;
  final String destination;
  final String eta;

  UberRideTrackingModel({
    required this.rideType,
    required this.carModel,
    required this.pickup,
    required this.destination,
    required this.eta,
  });

  factory UberRideTrackingModel.fromJson(Map<String, dynamic> json) =>
      UberRideTrackingModel(
        rideType: json['rideType'] as String,
        carModel: json['carModel'] as String,
        pickup: json['pickup'] as String,
        destination: json['destination'] as String,
        eta: json['eta'] as String,
      );
}
