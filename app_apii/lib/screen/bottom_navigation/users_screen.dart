import 'package:app_apii/api/controllers/auth_api_controller.dart';
import 'package:app_apii/api/controllers/users_api_controller.dart';
import 'package:app_apii/models/api_response.dart';
import 'package:app_apii/models/user.dart';
import 'package:app_apii/utils/context_extenssion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<User>>(
        future: UsersApiController().getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 45,
                    foregroundImage: NetworkImage(snapshot.data![index].image),
                  ),
                  title: Text(snapshot.data![index].firstName),
                  subtitle: Text(snapshot.data![index].email),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                'No Data',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  color: Colors.black45,
                ),
              ),
            );
          }
        },
      ),
    );
  }


}
