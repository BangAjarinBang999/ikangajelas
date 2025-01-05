import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../models/user_manager.dart';
import 'favorite_page.dart';
import 'homepge.dart';
import 'ikanlaut.dart';
import 'ikantawar.dart';
import 'profile_page.dart';
import 'settings_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final UserManager _userManager = UserManager();
  String firstName = '';
  String lastName = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final userData = await _userManager.getUserData();
    if (mounted) {
      setState(() {
        firstName = userData['firstName'] ?? '';
        lastName = userData['lastName'] ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fish Collection',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white, // Warna latar belakang AppBar
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Assets.images.ikan.image(width: 40), // Aset gambar
          )
        ],
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  ).then((_) => _loadUserData());
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/user.png'),
                      backgroundColor: Colors.grey,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$firstName $lastName',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/Love.png', // Ganti dengan path gambar Anda
                width: 24, // Lebar gambar
                height: 24, // Tinggi gambar
              ),
              title: const Text(
                'Favorit',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoritePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/Setting.png',
                width: 24,
                height: 24,
              ),
              title: const Text(
                'Pengaturan',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Featured Species Section
              const Text(
                'Featured Species',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                height: 200.0,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FeaturedCard(
                      image: 'assets/images/banner1.png',
                      title: 'Sturgeon',
                      onTap: () {
                        // Aksi saat diklik
                      },
                    ),
                    const SizedBox(width: 10.0),
                    FeaturedCard(
                      image: 'assets/images/badut.png',
                      title: 'Fish 2',
                      onTap: () {
                        // Aksi saat diklik
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              // Kategori Section
              const Text(
                'Kategori',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CategoryCard(
                    image: Assets.icons.laukPng.path,
                    label: 'Ikan Laut',
                    onTap: () {
                     Navigator.push(
                            context,
                              MaterialPageRoute(
                                    builder: (context) => SeawaterPage(),
                                  ),
                                ); 
                    },
                  ),
                  CategoryCard(
                    image: Assets.icons.laukPng.path,
                    label: 'Ikan Tawar',
                    onTap: () {
                      Navigator.push(
                            context,
                              MaterialPageRoute(
                                    builder: (context) => FreshwaterPage(),
                                  ),
                                ); 

                    },
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              // Fakta Tentang Ikan Section
              const Text(
                'Fakta Tentang Ikan',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 15.0),
              FactCard(
                image: 'assets/images/badut.png',
                title: 'Belajar Tentang Ikan Badut',
                description: 'Fakta Tentang Ikan Badut',
                onTap: () {
                  // Aksi saat detail diklik
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
