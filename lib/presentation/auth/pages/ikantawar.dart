import 'package:flutter/material.dart';

import '../../../core/assets/assets.gen.dart';
import 'detail_ikan_page.dart';

class FreshwaterPage extends StatefulWidget {
  const FreshwaterPage({super.key});

  @override
  State<FreshwaterPage> createState() => _FreshwaterPageState();
}

class _FreshwaterPageState extends State<FreshwaterPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Assets.images.ikan.image(width: 40),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const Text(
                  'Ikan Tawar',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildGridItem('Sturgeon', Assets.images.badut2.image()),
                    _buildGridItem('Arwana', Assets.images.hiu.image()),
                    _buildGridItem('Archer Fish', Assets.images.badut.image()),
                    _buildGridItem('Cupang', Assets.images.banner1.image()),
                    _buildGridItem('Koi', Assets.images.badut.image()),
                    _buildGridItem('Lohan', Assets.images.arwana.image()),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1,
            color: Colors.grey.withOpacity(0.10), // Warna garis
          ),
          BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
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

  Widget _buildGridItem(String title, Image image) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailIkanPage(
              title: title,
              image: image,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                child: SizedBox(
                  width: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: image,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
