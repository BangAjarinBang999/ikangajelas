import 'package:flutter/material.dart';
import 'dart:io';

import '../../../models/user_manager.dart';
import 'email_page.dart';
import 'privacy_policy_page.dart';
import 'version_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final UserManager _userManager = UserManager();
  String currentEmail = '';
  String birthDate = '';

  @override
  void initState() {
    super.initState();
    _loadEmail();
    _loadBirthDate();
    _userManager.addListener(() {
      if (mounted) setState(() {});
    });
  }

  Future<void> _loadEmail() async {
    final email = await _userManager.getEmail();
    if (mounted) {
      setState(() {
        currentEmail = email;
      });
    }
  }

  Future<void> _loadBirthDate() async {
    final userData = await _userManager.getUserData();
    if (mounted) {
      setState(() {
        birthDate = userData['birthDate'] ?? '';
      });
    }
  }

  @override
  void dispose() {
    _userManager.removeListener(() {
      setState(() {});
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pengaturan',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _buildSettingItem(
            title: 'Email',
            value: currentEmail,
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmailPage(currentEmail: currentEmail),
                ),
              );
              
              if (result != null) {
                await _userManager.updateEmail(result);
                _loadEmail();
              }
            },
          ),
          const Divider(height: 1),
          _buildSettingItem(
            title: 'Tanggal lahir',
            value: birthDate,
            onTap: () {
              // Handle birth date setting
            },
          ),
          const Divider(height: 1),
          _buildSettingItem(
            title: 'Kebijakan privasi',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrivacyPolicyPage(),
                ),
              );
            },
          ),
          const Divider(height: 1),
          _buildSettingItem(
            title: 'Tentang versi',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VersionPage(),
                ),
              );
            },
          ),
          const Divider(height: 1),
          _buildSettingItem(
            title: 'Keluar',
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text(
                      'Konfirmasi',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    content: const Text(
                      'Apakah Anda yakin ingin keluar dari aplikasi?',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Tutup dialog
                        },
                        child: const Text(
                          'Batal',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          exit(0); // Keluar dari aplikasi
                        },
                        child: const Text(
                          'Keluar',
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const Divider(height: 1),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required String title,
    String? value,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
        ),
      ),
      trailing: value != null
          ? Text(
              value,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
                fontFamily: 'Poppins',
              ),
            )
          : null,
      onTap: onTap,
    );
  }
} 