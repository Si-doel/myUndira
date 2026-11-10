import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/event_model.dart';

class EventService {
  Future<List<EventModel>> getEvents() async {
    try {
      // Membaca file JSON dari assets
      final String response = await rootBundle.loadString(
        'assets/data/events.json',
      );

      // Mengubah JSON menjadi List
      final List<dynamic> data = jsonDecode(response);

      // Mengubah setiap data JSON menjadi EventModel
      return data.map((json) {
        return EventModel.fromJson(json as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception('Gagal memuat data event: $e');
    }
  }
}
