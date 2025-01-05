import 'package:flutter/material.dart';
import 'package:ikantest/presentation/auth/pages/homepge.dart';

class Bahasa extends StatefulWidget {
  const Bahasa({super.key});

  @override
  State<Bahasa> createState() => _SelectLanguagePageState();
}

class _SelectLanguagePageState extends State<Bahasa> {
  String? selectedLanguage = 'Indonesia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/ikan.png',
                  width: 70.0,
                  height: 70.0,
                ),
              ],
            ),
            const SizedBox(height: 38.0),
            Text(
              'Select language',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Please update to a supported language of this app',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 45.0),
            SizedBox(
              width: 320,
              child: DropdownButtonFormField<String>(
                value: selectedLanguage,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                items: ['Indonesia', 'English', 'Sunda', 'Jawa', 'China']
                    .map((language) => DropdownMenuItem(
                          value: language,
                          child: Text(language),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 200.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Homeppq(initialIndex: 1),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
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
