import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:studentapp/model/data_model.dart';

class UserProvider extends ChangeNotifier {
  List<DataModel> _users = [];
  bool _isLoading = false;
  String? _error;

  List<DataModel> get users => _users;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchUsers() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
      final res = await http.get(uri);

      if (res.statusCode == 200) {
        final List<dynamic> raw = jsonDecode(res.body);
        _users = raw.map((e) => DataModel.fromJson(e)).toList();
      } else {
        _error = 'Server error: ${res.statusCode}';
      }
    } catch (e) {
      _error = 'Network error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
