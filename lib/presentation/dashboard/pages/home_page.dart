// import 'package:flutter/material.dart';
// import '../../../core/core.dart';
// import '../widgets/banner_slider.dart'; 
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.menu),
//           onPressed: () {},
//         ),
//         title: const Text("Koleksi Ikan"),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 16.0),
//             child: Icon(Icons.iso),
//           ),
//         ],
//         backgroundColor: Colors.teal,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16.0),
//         children: [
//           // Featured Species
//           const Text(
//             "Featured Species",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 10),
//           SizedBox(
//             height: 200,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: [
//                 _buildFeaturedCard(
//                   image: "assets/images/sturgeon.jpg", // Ganti dengan path gambar Anda
//                   title: "Sturgeon",
//                 ),
//                 _buildFeaturedCard(
//                   image: "assets/images/other_fish.jpg",
//                   title: "Another Fish",
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//           // Kategori
//           const Text(
//             "Kategori",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               _buildCategoryCard(
//                 title: "Ikan Laut",
//                 icon: Icons.water,
//                 onTap: () {},
//               ),
//               _buildCategoryCard(
//                 title: "Ikan Tawar",
//                 icon: Icons.cake,
//                 onTap: () {},
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           // Fakta Tentang Ikan
//           const Text(
//             "Fakta Tentang Ikan",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 10),
//           _buildFishFactCard(
//             image: "assets/images/badut.png", // Ganti dengan path gambar Anda
//             title: "Belajar Tentang Ikan Badut",
//             description: "Fakta Tentang Ikan Badut",
//             onTap: () {},
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: "Cari",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Beranda",
//           ),
//         ],
//         selectedItemColor: Colors.teal,
//       ),
//     );
//   }

//   Widget _buildFeaturedCard({required String image, required String title}) {
//     return Container(
//       width: 150,
//       margin: const EdgeInsets.only(right: 10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         image: DecorationImage(
//           image: AssetImage(image),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           Container(
//             width: double.infinity,
//             color: Colors.black54,
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCategoryCard({
//     required String title,
//     required IconData icon,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 150,
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.teal[100],
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               icon,
//               size: 40,
//               color: Colors.teal,
//             ),
//             const SizedBox(height: 10),
//             Text(
//               title,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFishFactCard({
//     required String image,
//     required String title,
//     required String description,
//     required VoidCallback onTap,
//   }) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: ListTile(
//         onTap: onTap,
//         leading: ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//           child: Image.asset(
//             image,
//             width: 50,
//             height: 50,
//             fit: BoxFit.cover,
//           ),
//         ),
//         title: Text(title),
//         subtitle: Text(description),
//         trailing: ElevatedButton(
//           onPressed: onTap,
//           child: const Text("Detail"),
//         ),
//       ),
//     );
//   }
// }

