import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/service_model.dart';

class StudentService {
  Future<List<ServiceModel>> getServices() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/services.json',
      );

      final List<dynamic> data = jsonDecode(response);

      return data.map((json) {
        return ServiceModel.fromJson(json as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception('Gagal memuat data layanan mahasiswa: $e');
    }
  }
}
