class Gate {
  final int id;
  final String name;
  final int throughputPerMinute;
  final String status;
  final double lat;
  final double lng;

  Gate({
    required this.id,
    required this.name,
    required this.throughputPerMinute,
    required this.status,
    required this.lat,
    required this.lng,
  });

  factory Gate.fromJson(Map<String, dynamic> json) {
    return Gate(
      id: json['id'],
      name: json['name'],
      throughputPerMinute: json['throughput_per_minute'] ?? 0,
      status: json['status'] ?? 'Normal',
      lat: (json['lat'] ?? 0).toDouble(),
      lng: (json['lng'] ?? 0).toDouble(),
    );
  }
}

class Incident {
  final int? id;
  final String category;
  final String severity;
  final double locationX;
  final double locationY;
  final String status;
  final String? reportedAt;

  Incident({
    this.id,
    required this.category,
    required this.severity,
    required this.locationX,
    required this.locationY,
    this.status = "Open",
    this.reportedAt,
  });

  factory Incident.fromJson(Map<String, dynamic> json) {
    return Incident(
      id: json['id'],
      category: json['category'],
      severity: json['severity'],
      locationX: (json['location_x'] ?? 0).toDouble(),
      locationY: (json['location_y'] ?? 0).toDouble(),
      status: json['status'] ?? "Open",
      reportedAt: json['reported_at'],
    );
  }
}

class Concession {
  final int id;
  final String name;
  final String category;
  final int estimatedWaitMin;
  final double lat;
  final double lng;

  Concession({
    required this.id,
    required this.name,
    required this.category,
    required this.estimatedWaitMin,
    required this.lat,
    required this.lng,
  });

  factory Concession.fromJson(Map<String, dynamic> json) {
    return Concession(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      estimatedWaitMin: json['estimated_wait_min'] ?? 0,
      lat: (json['lat'] ?? 0).toDouble(),
      lng: (json['lng'] ?? 0).toDouble(),
    );
  }
}
