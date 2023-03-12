import 'package:course_flutter_firebase/firebase/fb_auth_controller.dart';
import 'package:course_flutter_firebase/models/firebase_respones.dart';
import 'package:course_flutter_firebase/utils/context_extenssion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _emailLegnth = 0;

  String? _emailErorr;
  String? _passwordErorr;

  late TextEditingController _fullNameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();
    _fullNameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(context.localizations.register),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 20),

          Text(

            context.localizations.register_title,
            style: GoogleFonts.tajawal(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(height: 10),

          Text(
            context.localizations.register_sub_title,
            style: GoogleFonts.tajawal(
              fontWeight: FontWeight.w300,
              color: Colors.black45,
              fontSize: 16,
              height: 0.6,
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _fullNameTextController,
            style: GoogleFonts.poppins(),
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              constraints: BoxConstraints(
                maxHeight: _emailErorr == null ? 50 : 75,
              ),

              hintText: context.localizations.full_name,
              hintStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
                letterSpacing: 1,
                fontSize: 14,
              ),

              prefixIcon: Icon(
                Icons.person,
                color: Color(0xffca485c),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                  width: 2,
                  strokeAlign: StrokeAlign.center,
                  style: BorderStyle.solid,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color(0xffca485c),
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              //************************************
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.red.shade400,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red.shade800,
                  )),
              errorText: _emailErorr,

              //************************************
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _emailTextController,
            style: GoogleFonts.poppins(),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              constraints: BoxConstraints(
                maxHeight: _emailErorr == null ? 50 : 75,
              ),

              hintText: context.localizations.email,
              hintStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
                letterSpacing: 1,
                fontSize: 14,
              ),
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xffca485c),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                  width: 2,
                  strokeAlign: StrokeAlign.center,
                  style: BorderStyle.solid,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color(0xffca485c),
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              //************************************
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.red.shade400,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red.shade800,
                  )),
              errorText: _emailErorr,

              //************************************
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _passwordTextController,
            style: GoogleFonts.poppins(),
            obscureText: true,
            decoration: InputDecoration(
              constraints: BoxConstraints(
                maxHeight: _passwordErorr == null ? 50 : 75,
              ),
              contentPadding: EdgeInsets.zero,
              hintText: context.localizations.password,
              hintStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
                letterSpacing: 1,
                fontSize: 14,
              ),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xffca485c),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                  width: 2,
                  strokeAlign: StrokeAlign.center,
                  style: BorderStyle.solid,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color(0xffca485c),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.red.shade400,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red.shade800,
                  )),
              errorText: _passwordErorr,
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () => _performLogin(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff870160),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: Size(double.infinity, 50),
            ),
            child: Text(context.localizations.register),
          ),
        ]),
      ),
    );
  }

  void _performLogin() {
    if (_checkData()) {
      _register();
    }
  }

  bool _checkData() {
    setState(() {
      _emailErorr = _emailTextController.text.isEmpty ? 'Enter email!' : null;
      _passwordErorr =
          _passwordTextController.text.isEmpty ? 'Enter password!' : null;
    });
    if (_fullNameTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(message: 'Enter required data!', error: true);
    return false;
  }

  void _register() async {
    FirebaseResponse response = await FbAuthController().createAccount(
        email: _emailTextController.text,
        password: _passwordTextController.text,
        fullName: _fullNameTextController.text);
    if (response.success) {
      Navigator.pop(context);
    }
    context.showSnackBar(message: response.message, error: !response.success);
  }
}
