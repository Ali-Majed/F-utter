import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example")
        ,
      ),
      body: Column(
        children: [
          Text("Welcome bake...",style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black,width: 1),
                borderRadius: BorderRadius.circular(10)
              )
            ),
          )
        ],
      ),
    );
  }
}
