import 'package:flutter/material.dart';

import 'home.dart';
import 'search_page.dart';

class Homeppq extends StatefulWidget {
  final int initialIndex;
  const Homeppq({this.initialIndex = 1, super.key});

  @override
  State<Homeppq> createState() => _HomeppqState();
}

class _HomeppqState extends State<Homeppq> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  final List<Widget> pages = [
    const SearchPage(),
    const Home(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Garis di atas BottomNavigationBar
          Container(
            height: 1,
            color: Colors.grey.withOpacity(0.10), // Warna garis
          ),
          BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(left: 120),
                  child: ImageIcon(AssetImage('assets/icons/search.png')),
                ),
                backgroundColor: Colors.black,
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(right: 120),
                  child: ImageIcon(AssetImage('assets/icons/buttonhome1.png')),
                ),
                label: '', // Label kosong
              ),
            ],
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

// Widget untuk Featured Species Card
class FeaturedCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;

  const FeaturedCard({
    required this.image,
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 300.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                child: Image.asset(
                  image,
                  height: 120.0,
                  width: 300.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget untuk Category Card
class CategoryCard extends StatelessWidget {
  final IconData? icon;
  final String? image;
  final String label;
  final VoidCallback onTap;

  const CategoryCard({
    this.icon,
    this.image,
    required this.label,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Jika ada gambar, tampilkan gambar
                if (image != null)
                  ClipOval(
                    child: Image.asset(
                      image!,
                      fit: BoxFit.cover,
                      width: 70.0,
                      height: 70.0,
                    ),
                  ),
                // Jika ada ikon, tampilkan ikon di atas gambar
                if (icon != null)
                  Icon(
                    icon,
                    size: 30.0,
                    color: Colors.blue,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            label,
            style: const TextStyle(fontSize: 14.0),
          ),
          SizedBox(width: 95.0)
        ],
      ),
    );
  }
}

// Widget untuk Fact Card
class FactCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final VoidCallback onTap;

  const FactCard({
    required this.image,
    required this.title,
    required this.description,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    image,
                    width: 150.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              "Detail",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
