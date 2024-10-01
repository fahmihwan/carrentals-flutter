class CarModel {
  final int id;
  final bool statusEnabled;
  final int userId;
  final int dailyRentalPrice;
  final String merk;
  final String year;
  final String licensePlate;
  final DateTime createdAt;
  final String address;
  final String file;
  final String features;

  const CarModel({
    required this.id,
    required this.statusEnabled,
    required this.userId,
    required this.dailyRentalPrice,
    required this.merk,
    required this.year,
    required this.licensePlate,
    required this.createdAt,
    required this.address,
    required this.file,
    required this.features,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      statusEnabled: json['statusenabled'],
      userId: json['user_id'],
      dailyRentalPrice: json['daily_rental_price'],
      merk: json['merk'],
      year: json['year'],
      licensePlate: json['license_plate'],
      createdAt: DateTime.parse(json['created_at']),
      address: json['address'],
      file: json['file'],
      features: json['features'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'statusenabled': statusEnabled,
      'user_id': userId,
      'daily_rental_price': dailyRentalPrice,
      'merk': merk,
      'year': year,
      'license_plate': licensePlate,
      'created_at': createdAt.toIso8601String(),
      'address': address,
      'file': file,
      'features': features,
    };
  }
}
