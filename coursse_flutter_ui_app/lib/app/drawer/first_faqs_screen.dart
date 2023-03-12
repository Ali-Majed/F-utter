import 'package:coursse_flutter_ui_app/models/faq.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstFAQsScreen extends StatefulWidget {
  const FirstFAQsScreen({Key? key}) : super(key: key);

  @override
  State<FirstFAQsScreen> createState() => _FirstFAQsScreenState();
}

class _FirstFAQsScreenState extends State<FirstFAQsScreen> {
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
        title: Text("FAQs (1)"),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          elevation: 6,

          dividerColor: Colors.blue.shade100,
          expandedHeaderPadding: EdgeInsets.all(10),
          animationDuration: Duration(milliseconds: 500),
          expansionCallback: (panelIndex, isExpanded) {
            setState(() => _faqs[panelIndex].isExpanded=!isExpanded);
          },
          children: _faqs
              .map(
                (faq) => ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(faq.question,style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold ,
                        color: Colors.black45
                      ),),
                    );
                  },
                  body: Container(
                    color: Colors.grey,
                    width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      child: Text(faq.answer,style: GoogleFonts.poppins(
                        fontSize: 15,
                      ),)),
                  isExpanded: faq.isExpanded,
                  canTapOnHeader: true
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
