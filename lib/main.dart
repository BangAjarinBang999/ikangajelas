import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/core.dart';
import 'models/favorite_fish_manager.dart';
import 'presentation/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final favoriteManager = FavoriteFishManager();
  await favoriteManager.init(); // Inisialisasi data favorit
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        textTheme: GoogleFonts.quicksandTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: AppBarTheme(
          color: AppColors.white,
          titleTextStyle: GoogleFonts.quicksand(
            color: AppColors.textColor,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: const IconThemeData(
            color: AppColors.textColor,
          ),
          centerTitle: true,
          shape: Border(
            bottom: BorderSide(
              color: AppColors.stroke,
            ),
          ),
        ),
        fontFamily: 'Poppins',
      ),
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
