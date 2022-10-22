import 'dart:convert';

class OrdemServicoLocation {
  double latitude;
  double longitude;
  DateTime dataHora;
  OrdemServicoLocation({
    required this.latitude,
    required this.longitude,
    required this.dataHora,
  });

  OrdemServicoLocation copyWith({
    double? latitude,
    double? longitude,
    DateTime? dataHora,
  }) {
    return OrdemServicoLocation(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      dataHora: dataHora ?? this.dataHora,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'dataHora': dataHora.millisecondsSinceEpoch,
    };
  }

  factory OrdemServicoLocation.fromMap(Map<String, dynamic> map) {
    return OrdemServicoLocation(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      dataHora: DateTime.fromMillisecondsSinceEpoch(map['dataHora'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrdemServicoLocation.fromJson(String source) =>
      OrdemServicoLocation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OrdemServicoLocation(latitude: $latitude, longitude: $longitude, dataHora: $dataHora)';

  @override
  bool operator ==(covariant OrdemServicoLocation other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude &&
        other.longitude == longitude &&
        other.dataHora == dataHora;
  }

  @override
  int get hashCode =>
      latitude.hashCode ^ longitude.hashCode ^ dataHora.hashCode;
}
