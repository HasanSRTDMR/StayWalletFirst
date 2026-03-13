class DigitalKeyModel {
  final String id;
  final String hotelName;
  final String roomInfo;
  final String roomNumber;
  final String roomType;
  final bool isActive;
  final String? imageUrl;
  final DateTime? checkInDate;
  final DateTime? checkOutDate;

  DigitalKeyModel({
    required this.id,
    required this.hotelName,
    required this.roomInfo,
    required this.roomNumber,
    required this.roomType,
    this.isActive = true,
    this.imageUrl,
    this.checkInDate,
    this.checkOutDate,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'hotelName': hotelName,
        'roomInfo': roomInfo,
        'roomNumber': roomNumber,
        'roomType': roomType,
        'isActive': isActive,
        'imageUrl': imageUrl,
        'checkInDate': checkInDate?.toIso8601String(),
        'checkOutDate': checkOutDate?.toIso8601String(),
      };

  factory DigitalKeyModel.fromJson(Map<String, dynamic> json) =>
      DigitalKeyModel(
        id: json['id'] as String,
        hotelName: json['hotelName'] as String,
        roomInfo: json['roomInfo'] as String,
        roomNumber: json['roomNumber'] as String,
        roomType: json['roomType'] as String,
        isActive: json['isActive'] as bool? ?? true,
        imageUrl: json['imageUrl'] as String?,
        checkInDate: json['checkInDate'] != null
            ? DateTime.parse(json['checkInDate'] as String)
            : null,
        checkOutDate: json['checkOutDate'] != null
            ? DateTime.parse(json['checkOutDate'] as String)
            : null,
      );
}
