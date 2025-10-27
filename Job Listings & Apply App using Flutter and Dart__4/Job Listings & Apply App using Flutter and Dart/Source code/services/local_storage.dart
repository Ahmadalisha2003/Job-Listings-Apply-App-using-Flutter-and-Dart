import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/application.dart';

class LocalStorage {
  static const _appsKey = 'applications';

  static Future<List<Application>> loadApplications() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_appsKey);
    if (raw == null || raw.isEmpty) return [];
    final List<dynamic> arr = jsonDecode(raw);
    return arr.map((e) => Application.fromJson(e)).toList();
  }

  static Future<void> saveApplications(List<Application> apps) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = jsonEncode(apps.map((e) => e.toJson()).toList());
    await prefs.setString(_appsKey, raw);
  }
}
