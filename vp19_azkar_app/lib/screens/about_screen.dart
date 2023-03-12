import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key? key, this.message}) : super(key: key);

  String? message;

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Text(widget.message ?? 'No message'),
      ),
    );
  }
}
