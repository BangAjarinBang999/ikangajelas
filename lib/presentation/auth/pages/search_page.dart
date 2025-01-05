import 'package:flutter/material.dart';

import '../../../core/assets/assets.gen.dart';
import 'detail_ikan_page.dart';
import 'homepge.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> searchResults = [];
  
  final List<Map<String, dynamic>> allFish = [
    // Ikan Laut
    {'name': 'ClownFish', 'image': Assets.images.badut2.image()},
    {'name': 'Shark', 'image': Assets.images.hiu.image()},
    {'name': 'Marlin', 'image': Assets.images.badut.image()},
    {'name': 'Remora', 'image': Assets.images.banner1.image()},
    {'name': 'Puffer Fish', 'image': Assets.images.badut.image()},
    {'name': 'Lion Fish', 'image': Assets.images.banner1.image()},
    // Ikan Tawar
    {'name': 'Sturgeon', 'image': Assets.images.badut2.image()},
    {'name': 'Arwana', 'image': Assets.images.hiu.image()},
    {'name': 'Archer Fish', 'image': Assets.images.badut.image()},
    {'name': 'Cupang', 'image': Assets.images.banner1.image()},
    {'name': 'Koi', 'image': Assets.images.badut.image()},
    {'name': 'Lohan', 'image': Assets.images.arwana.image()},
  ];

  void searchFish(String query) {
    if (query.isEmpty) {
      setState(() {
        searchResults = [];
      });
      return;
    }

    setState(() {
      searchResults = allFish
          .where((fish) =>
              fish['name'].toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Homeppq(),
              ),
            );
          },
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: _searchController,
            onChanged: searchFish,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              border: InputBorder.none,
              hintText: 'Cari...',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: searchResults.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailIkanPage(
                      title: searchResults[index]['name'],
                      image: searchResults[index]['image'],
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: searchResults[index]['image'],
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      searchResults[index]['name'],
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}