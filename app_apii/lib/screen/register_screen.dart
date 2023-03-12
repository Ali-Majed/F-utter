import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _emailLegnth = 0 ;

  String? _emailErorr;
  String? _passwordErorr;

  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;


  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REGISTER'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back ...',
                style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),),
              Text('Enter email & password ...',
                style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w300,
                  color: Colors.black45,
                  fontSize: 16,
                  height: 0.6,
                ),),
              SizedBox(height: 20),
              TextField(
                controller: _emailTextController,
                style: GoogleFonts.poppins(),
                keyboardType: TextInputType.emailAddress,
                //********************************
                textAlign: TextAlign.start,
                textDirection: TextDirection.ltr,
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.done,
                textAlignVertical: TextAlignVertical.center,
                obscureText: false,
                obscuringCharacter: '*',
                //************************************
                onChanged: (String value) => print(value) ,
                onSubmitted: (String value) => print(value),
                onTap: () => print('Tapped'),
                //***************************************
                showCursor: true,
                cursorColor: Colors.blue ,
                // cursorHeight: 0,
                cursorWidth: 2,
                cursorRadius: Radius.circular(0),
                //**********************************
                enabled: true,
                readOnly: false,
                //**********************************
                autocorrect: true,
                autofocus: false,
                //***********************************
                autofillHints: ['@gmail.com','hotmail.com'],
                enableSuggestions: true,
                //***********************************
                // maxLength: 10,
                //***********************************
                // minLines: 1,
                // maxLines: 1,
                //***********************************
                minLines: null,
                maxLines: null,
                expands: true,
                //***********************************
                decoration: InputDecoration(
                  // counterText: '',
                  //***********************************
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  constraints: BoxConstraints(
                    maxHeight: _emailErorr == null ? 50 : 75 ,
                  ),
                  // ***********************************
                  hintText: 'Email',
                  hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                    fontSize: 14,
                  ),
                  hintMaxLines: 1,
                  hintTextDirection: TextDirection.ltr,
                  //***********************************
                  // labelText: 'Email',
                  // labelStyle: GoogleFonts.poppins(
                  //   fontWeight: FontWeight.w300,
                  //   fontSize: 14,
                  // ),
                  // floatingLabelAlignment: FloatingLabelAlignment.start,
                  // floatingLabelBehavior: FloatingLabelBehavior.auto,
                  // floatingLabelStyle: GoogleFonts.poppins(
                  //   fontWeight: FontWeight.bold,
                  //   fontSize: 14,
                  // ),
                  // alignLabelWithHint: false,
                  //***********************************
                  fillColor: Colors.grey,
                  filled: false,
                  //***********************************
                  // helperText: 'Ex: email@app.com',
                  helperMaxLines: 1,
                  helperStyle: GoogleFonts.poppins(
                      color: Colors.black45,
                      fontSize: 12
                  ),
                  //***********************************
                  enabled: false,
                  //***********************************
                  // icon: Icon(Icons.email),
                  prefixIcon: Icon(Icons.email),
                  // prefixText: 'email-',
                  // prefixStyle: GoogleFonts.cabin(fontSize: 22),
                  //************************************
                  // suffixIcon: IconButton(
                  //   onPressed: (){},
                  //   icon: Icon(Icons.send),
                  // ),
                  // suffixText: 'Available',
                  // suffixStyle: GoogleFonts.poppins(
                  //   fontSize: 12,
                  //   color: Colors.grey,
                  // ),
                  //************************************
                  // border: UnderlineInputBorder(),
                  // focusedBorder: UnderlineInputBorder(
                  // borderSide: BorderSide(
                  //   color: Colors.blue.shade800,
                  // ),
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
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
                      color: Colors.blue.shade700,
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
                      )
                  ),
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
                    maxHeight: _passwordErorr == null ? 50 : 75 ,
                  ),
                  contentPadding: EdgeInsets.zero,
                  hintText: 'Password',
                  hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 2,
                      strokeAlign: StrokeAlign.center,
                      style: BorderStyle.solid,
                    ),
                  ),

                  //************************************
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blue.shade700,
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
                      )
                  ),
                  errorText: _passwordErorr,
                  //************************************

                ),

              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () => _performLogin(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('LOGIN'),
              ),
            ]
        ),
      ),
    );
  }



  void _performLogin(){
    if(_checkData()){
      _login();
    }
  }
  bool _checkData(){
    setState(() {
      _emailErorr = _emailTextController.text.isEmpty ? 'Enter email!' : null ;
      _passwordErorr = _passwordTextController.text.isEmpty ? 'Enter password!' : null ;
    });
    if(_emailTextController.text.isNotEmpty
        && _passwordTextController.text.isNotEmpty){
      return true ;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Enter requiered data'),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
      ),
    );
    return false;
  }
  void _login(){
    Navigator.pushReplacementNamed(context, '/products_screen');
  }
}

