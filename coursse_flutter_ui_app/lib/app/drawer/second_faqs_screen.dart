import 'package:coursse_flutter_ui_app/models/faq.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondFAQsScreen extends StatefulWidget {
  const SecondFAQsScreen({Key? key}) : super(key: key);

  @override
  State<SecondFAQsScreen> createState() => _SecondFAQsScreenState();
}

class _SecondFAQsScreenState extends State<SecondFAQsScreen> {
  List<FAQs> _faqs = <FAQs>[
    FAQs("Question #1", "Answer #1"),
    FAQs("Question #2", "Answer #2"),
    FAQs("Question #3", "Answer #3"),
    FAQs("Question #4", "Answer #4"),
    FAQs("Question #5", "Answer #5"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQs (2)"),
      ),
      body: ListView.builder(
        itemCount: _faqs.length,
        itemBuilder: (context, index) {
        return ExpansionTile(
          collapsedBackgroundColor: Colors.grey.shade100,
          collapsedIconColor:Colors.blue.shade800 ,
          collapsedTextColor:Colors.blue.shade800 ,
          //***********************************************
          textColor: Colors.black45,
          iconColor: Colors.black45,
          //***********************************************
          expandedAlignment: Alignment.centerLeft,
          leading: Icon(Icons.question_answer,size: 18,),
          title: Text(_faqs[index].question,style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.bold ,
          )),
        children: [
          Text(_faqs[index].answer)
          ],);
      },),
    );
  }
}

