import 'package:flutter/material.dart';

import 'joinus.dart';
import 'signup.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background wave image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/wave.png',
              fit: BoxFit.cover,
              height: 500.0, // Sesuaikan tinggi gambar wave
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(), // Mendorong elemen ke bawah
                // Logo
                Image.asset(
                  'assets/images/ikan.png',
                  width: 80.0,
                  height: 80.0,
                ),
                const SizedBox(height: 10.0),
                // Tagline
                const Text(
                  'Smart Fish, Prosperous Seas,\nRight Information, Great Future!',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 40.0),
                // Buttons
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                            MaterialPageRoute(
                                  builder: (context) => JoinUs(),
                                ),
                              );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 26.0,
                          vertical: 18.0,
                        ),
                      ),
                      child: const Text(
                        'Join Us',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    ElevatedButton(
                       onPressed: () {
                        Navigator.push(
                          context,
                            MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                              );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 26.0,
                          vertical: 18.0,
                        ),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 70.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}






