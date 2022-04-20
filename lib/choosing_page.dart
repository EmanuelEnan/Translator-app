import 'package:flutter/material.dart';
import 'package:translator_app/2nd_home_page.dart';
import 'package:translator_app/home_page.dart';

class ChoosingPage extends StatelessWidget {
  const ChoosingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose the language'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose your language',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const HomePage()),
                  ),
                );
              },
              child: const Text('From English to other languages'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondHomePage(),
                  ),
                );
              },
              child: const Text('From Bangla to other languages'),
            ),
          ],
        ),
      ),
    );
  }
}
