import 'dart:convert';

class OrdemServicoLocation {
  double latitude;
  double longitude;
  DateTime localHora;
  OrdemServicoLocation({
    required this.latitude,
    required this.longitude,
    required this.localHora,
  });

  OrdemServicoLocation copyWith({
    double? latitude,
    double? longitude,
    DateTime? localHora,
  }) {
    return OrdemServicoLocation(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      localHora: localHora ?? this.localHora,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'localHora': localHora.millisecondsSinceEpoch,
    };
  }

  factory OrdemServicoLocation.fromMap(Map<String, dynamic> map) {
    return OrdemServicoLocation(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      localHora: DateTime.fromMillisecondsSinceEpoch(map['localHora'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrdemServicoLocation.fromJson(String source) =>
      OrdemServicoLocation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OrdemServicoLocation(latitude: $latitude, longitude: $longitude, localHora: $localHora)';

  @override
  bool operator ==(covariant OrdemServicoLocation other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude &&
        other.longitude == longitude &&
        other.localHora == localHora;
  }

  @override
  int get hashCode =>
      latitude.hashCode ^ longitude.hashCode ^ localHora.hashCode;
}
