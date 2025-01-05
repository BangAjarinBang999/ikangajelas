import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../../../models/favorite_fish_manager.dart';
import '../../../models/user_manager.dart';
import 'detail_ikan_page.dart';
import 'edit_profile_page.dart';
import 'settings_page.dart';

// Singleton untuk menyimpan data profil

class ProfileData extends ChangeNotifier {
  static final ProfileData _instance = ProfileData._internal();

  factory ProfileData() {
    return _instance;
  }

  ProfileData._internal();

  String firstName = '';
  String lastName = '';
  String bio = '';
  final UserManager _userManager = UserManager();

  Future<void> loadUserData() async {
    final userData = await _userManager.getUserData();
    firstName = userData['firstName'] ?? '';
    lastName = userData['lastName'] ?? '';
    bio = '';
    notifyListeners();
  }

  // Callback untuk memperbarui UI
  List<Function()> _listeners = [];

  void addListener(Function() listener) {
    _listeners.add(listener);
  }

  void removeListener(Function() listener) {
    _listeners.remove(listener);
  }

  void updateProfile({
    required String firstName,
    required String lastName,
    required String bio,
  }) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.bio = bio;

    // Notify all listeners
    for (var listener in _listeners) {
      listener();
    }
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserManager _userManager = UserManager();
  final FavoriteFishManager _favoriteManager = FavoriteFishManager();
  String firstName = '';
  String lastName = '';
  String bio = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _favoriteManager.addListener(() {
      if (mounted) setState(() {});
    });
  }

  Future<void> _loadUserData() async {
    final userData = await _userManager.getUserData();
    setState(() {
      firstName = userData['firstName'] ?? '';
      lastName = userData['lastName'] ?? '';
      bio = userData['bio'] ?? '';
    });
  }

  @override
  void dispose() {
    _favoriteManager.removeListener(() {
      setState(() {});
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteFishes = _favoriteManager.favoriteFishes;
    final displayedFishes = favoriteFishes.take(4).toList();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
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
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/user.png'),
            backgroundColor: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            '$firstName $lastName',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            bio.isEmpty ? '' : bio,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 20),
          // Edit Profile Button
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(
                    firstName: firstName,
                    lastName: lastName,
                    bio: '',
                  ),
                ),
              );
              
              if (result != null) {
                firstName = result['firstName'];
                lastName = result['lastName'];
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(color: Colors.grey),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Edit Profil',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Menu Items
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMenuItem(
                icon: Icons.settings,
                label: 'Pengaturan',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ),
                  );
                },
              ),
              _buildMenuItem(
                icon: Icons.bookmark,
                label: 'Bookmarks',
                onTap: () {
                  // Handle bookmarks
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Favorite Fish Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Ikan Favorit',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _favoriteManager.favoriteFishes.isEmpty
                ? const Center(
                    child: Text(
                      'Belum ada ikan favorit',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: _favoriteManager.favoriteFishes.length > 4 
                        ? 4 
                        : _favoriteManager.favoriteFishes.length,
                    itemBuilder: (context, index) {
                      final fish = _favoriteManager.favoriteFishes[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          leading: CircleAvatar(
                            backgroundImage: fish['image'].image,
                          ),
                          title: Text(
                            fish['name'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailIkanPage(
                                  title: fish['name'],
                                  image: fish['image'],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}