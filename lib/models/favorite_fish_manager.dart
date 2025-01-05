
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FavoriteFishManager {
  static final FavoriteFishManager _instance = FavoriteFishManager._internal();
  factory FavoriteFishManager() => _instance;
  FavoriteFishManager._internal();

  final List<Map<String, dynamic>> _favoriteFishes = [];
  final List<Function()> _listeners = [];

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final String? favoritesJson = prefs.getString('favorites');
    if (favoritesJson != null) {
      final List<dynamic> decoded = jsonDecode(favoritesJson);
      _favoriteFishes.clear();
      _favoriteFishes.addAll(List<Map<String, dynamic>>.from(decoded));
      _notifyListeners();
    }
  }

  void addListener(Function() listener) {
    _listeners.add(listener);
  }

  void removeListener(Function() listener) {
    _listeners.remove(listener);
  }

  List<Map<String, dynamic>> get favoriteFishes => List.from(_favoriteFishes);

  bool isFavorite(String fishName) {
    return _favoriteFishes.any((fish) => fish['name'] == fishName);
  }

  Future<void> toggleFavorite(Map<String, dynamic> fish) async {
    final index = _favoriteFishes.indexWhere((f) => f['name'] == fish['name']);
    if (index >= 0) {
      _favoriteFishes.removeAt(index);
    } else {
      _favoriteFishes.add(fish);
    }
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('favorites', jsonEncode(_favoriteFishes));
    _notifyListeners();
  }

  void _notifyListeners() {
    for (var listener in _listeners) {
      listener();
    }
  }
} 