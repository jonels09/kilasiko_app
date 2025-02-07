import 'package:flutter/foundation.dart';
import '../services/database_service.dart';

class HomeViewModel with ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> initDatabase() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _databaseService.database;
      print('Database initialized successfully');
    } catch (error) {
      print('Database initialization failed: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
