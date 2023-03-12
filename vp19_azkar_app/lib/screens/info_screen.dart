import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  String message = 'No Message';

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Future.delayed(Duration.zero, () {
  //     ModalRoute? modalRoute = ModalRoute.of(context);
  //     if (modalRoute != null) {
  //       if (modalRoute.settings.arguments != null &&
  //           modalRoute.settings.arguments is Map<String, dynamic>) {
  //         Map<String, dynamic> data =
  //             modalRoute.settings.arguments as Map<String, dynamic>;
  //         if (data.containsKey('message')) {
  //           message = data['message'];
  //           print(message);
  //           setState(() {});
  //         }
  //       }
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    print('build');
    ModalRoute? modalRoute = ModalRoute.of(context);
    if (modalRoute != null) {
      if (modalRoute.settings.arguments != null &&
          modalRoute.settings.arguments is Map<String, dynamic>) {
        Map<String, dynamic> data =
            modalRoute.settings.arguments as Map<String, dynamic>;
        if (data.containsKey('message')) {
          message = data['message'];
        }
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
