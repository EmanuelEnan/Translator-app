import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:translator_app/display_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  String? _dropDown;
  String? translatedText;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translator App'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Type in English',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: DropdownButton(
                style: const TextStyle(
                  color: Colors.blue,
                ),
                isExpanded: true,
                hint: _dropDown == null
                    ? const Text('Select language')
                    : Text(_dropDown!),
                items: ['English', 'Spanish', 'German', 'Chineese', 'Bengali']
                    .map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _dropDown = newValue.toString();
                  });
                  if (_dropDown == 'English') {
                    translateText('en');
                  } else if (_dropDown == 'Spanish') {
                    translateText('es');
                  } else if (_dropDown == 'German') {
                    translateText('de');
                  } else if (_dropDown == 'Chineese') {
                    translateText('zh-cn');
                  } else if (_dropDown == 'Bengali') {
                    translateText('bn');
                  }
                },
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.only(top: 30),
            //   child: translatedText != null
            //       ? Text(
            //           translatedText!,
            //           style: const TextStyle(fontSize: 26),
            //         )
            //       : const Text(''),
            // )
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DisplayPage(
                      text: translatedText,
                    ),
                  ),
                );
              },
              child: const Text('Translate'),
            ),
          ],
        ),
      ),
    );
  }

  void translateText(String locale) {
    final translator = GoogleTranslator();
    translator.translate(controller.text, to: locale).then(
      (value) {
        translatedText = value.text;
      },
    );
  }
}
