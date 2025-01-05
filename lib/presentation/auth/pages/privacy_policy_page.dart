import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy Policy',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'KEBIJAKAN PRIVASI',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Kebijakan privasi ini menjelaskan data pribadi yang dikumpulkan atau dihasilkan (diproses) saat Anda berinteraksi dengan aplikasi seluler aplikasi.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                height: 1.5,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Hal ini juga menjelaskan bagaimana data pribadi Anda digunakan, dibagikan dan dilindungi, pilihan apa yang Anda miliki terkait dengan data pribadi Anda data dan bagaimana Anda dapat menghubungi kami.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                height: 1.5,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
} 