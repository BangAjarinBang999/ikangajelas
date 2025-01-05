import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserManager extends ChangeNotifier {
  static final UserManager _instance = UserManager._internal();
  factory UserManager() => _instance;
  UserManager._internal();

  Future<void> saveUser(String email, String password, String firstName, String lastName, String birthDate) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', email);
    await prefs.setString('user_password', password);
    await prefs.setString('user_firstName', firstName);
    await prefs.setString('user_lastName', lastName);
    await prefs.setString('user_birthDate', birthDate);
  }

  Future<bool> validateUser(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('user_email');
    final savedPassword = prefs.getString('user_password');
    
    return email == savedEmail && password == savedPassword;
  }

  Future<String> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_email') ?? '';
  }

  Future<Map<String, String>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'firstName': prefs.getString('user_firstName') ?? '',
      'lastName': prefs.getString('user_lastName') ?? '',
      'bio': prefs.getString('user_bio') ?? '',
      'birthDate': prefs.getString('user_birthDate') ?? '',
    };
  }

  Future<void> updateNames(String firstName, String lastName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_firstName', firstName);
    await prefs.setString('user_lastName', lastName);
  }

  Future<void> updateBio(String bio) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_bio', bio);
  }

  Future<void> updateEmail(String newEmail) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', newEmail);
    notifyListeners();
  }

  Future<void> updateEmailAndPassword(String newEmail, String newPassword) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', newEmail);
    await prefs.setString('user_password', newPassword);
  }

  Future<void> updateBirthDate(String birthDate) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_birthDate', birthDate);
    notifyListeners();
  }
} 