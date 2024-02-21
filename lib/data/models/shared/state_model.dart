class StateModel {
  final int id;
  final String name;
  final int countryId;
  final double? latitude;
  final double? longitude;

  StateModel({
    required this.id,
    required this.name,
    required this.countryId,
    required this.latitude,
    required this.longitude,
  });

  StateModel copyWith({
    int? id,
    String? name,
    int? countryId,
    double? latitude,
    double? longitude,
  }) =>
      StateModel(
        id: id ?? this.id,
        name: name ?? this.name,
        countryId: countryId ?? this.countryId,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        id: json['id'],
        name: json['name'],
        countryId: json['country_id'],
        latitude: json['latitude'] != null ? double.tryParse(json['latitude'].toString()) : null,
        longitude: json['longitude'] != null ? double.tryParse(json['longitude'].toString()) : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'country_id': countryId,
        'latitude': latitude,
        'longitude': longitude,
      };
}
