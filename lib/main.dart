import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Aid',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WhatsAppHelperForm(title: 'WhatsApp Aid'),
    );
  }
}

class WhatsAppHelperForm extends StatefulWidget {
  WhatsAppHelperForm({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WhatsAppHelperFormState createState() => _WhatsAppHelperFormState();
}

class _WhatsAppHelperFormState extends State<WhatsAppHelperForm> {
  _fireBrowser() async {
    String url = "https://wa.me/" + txtEditController.text.substring(1, txtEditController.text.length);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
              decoration: InputDecoration(
                hintText: 'Enter a phone number, like +9199000XXXXX'
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fireBrowser,
        tooltip: 'Submit',
        child: Icon(Icons.message),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
