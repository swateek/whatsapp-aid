import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Aid',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const WhatsAppHelperForm(title: 'WhatsApp Aid'),
    );
  }
}

class WhatsAppHelperForm extends StatefulWidget {
  const WhatsAppHelperForm({super.key, required this.title});

  final String title;

  @override
  State<WhatsAppHelperForm> createState() => _WhatsAppHelperFormState();
}

class _WhatsAppHelperFormState extends State<WhatsAppHelperForm> {
  Future<void> _fireBrowser() async {
    final phoneNumber = txtEditController.text.replaceAll(RegExp(r'\D'), '');
    if (phoneNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid phone number.')),
      );
      return;
    }

    final url = Uri.https('wa.me', '/$phoneNumber');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
      return;
    }

    throw Exception('Could not launch $url');
  }

  final txtEditController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    txtEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: txtEditController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Enter a phone number, like +9199000XXXXX',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fireBrowser,
        tooltip: 'Submit',
        child: const Icon(Icons.message),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
