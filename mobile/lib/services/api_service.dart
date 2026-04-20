import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class ApiService {
  // Use 10.0.2.2 for Android Emulator, 127.0.0.1 for iOS Simulator / Web
  static const String baseUrl = 'http://127.0.0.1:8001/api';

  Future<List<Gate>> fetchGates() async {
    final response = await http.get(Uri.parse('$baseUrl/gates'));
    if (response.statusCode == 200) {
      Iterable l = jsonDecode(response.body);
      return List<Gate>.from(l.map((model) => Gate.fromJson(model)));
    } else {
      throw Exception('Failed to load gates');
    }
  }

  Future<List<Concession>> fetchConcessions({String? category}) async {
    final uri = category != null
        ? Uri.parse('$baseUrl/concessions?category=$category')
        : Uri.parse('$baseUrl/concessions');

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Iterable l = jsonDecode(response.body);
      return List<Concession>.from(
        l.map((model) => Concession.fromJson(model)),
      );
    } else {
      throw Exception('Failed to load concessions');
    }
  }

  Future<List<Incident>> fetchIncidents() async {
    final response = await http.get(Uri.parse('$baseUrl/incidents'));
    if (response.statusCode == 200) {
      Iterable l = jsonDecode(response.body);
      return List<Incident>.from(l.map((model) => Incident.fromJson(model)));
    } else {
      throw Exception('Failed to load incidents');
    }
  }

  Future<Incident> reportIncident(Incident incident) async {
    final response = await http.post(
      Uri.parse('$baseUrl/incidents'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'category': incident.category,
        'severity': incident.severity,
        'location_x': incident.locationX,
        'location_y': incident.locationY,
      }),
    );

    if (response.statusCode == 200) {
      return Incident.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to report incident');
    }
  }
}
