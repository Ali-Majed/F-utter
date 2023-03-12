import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  String? _emailError;
  String? _passwordError;

  @override
  void initState() {
    super.initState();
    _emailTextController=TextEditingController();
    _passwordTextController=TextEditingController();
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
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20 ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back...',
            style: GoogleFonts.tajawal(
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),
            ),
            Text(
              'Enter email & password',
              style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                color: Colors.black45,
                height: 0.8
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _emailTextController,
              style: GoogleFonts.poppins(),
              keyboardType: TextInputType.emailAddress,
              //****************************
              textAlign: TextAlign.start,
              textDirection:TextDirection.ltr,
              textCapitalization: TextCapitalization.none,
              textInputAction: TextInputAction.done,
              textAlignVertical: TextAlignVertical.center,
              obscureText: false,
              obscuringCharacter: '*',
              //****************************
              onChanged: (String value)=> print(value),
              onSubmitted: (String value)=> print(value),

              //****************************
              showCursor: true,
              cursorColor: Colors.pink,
              cursorWidth: 2,
              cursorRadius: Radius.circular(0),

              //****************************
              enabled: true,
              readOnly: false,
              //****************************
              autocorrect: true,
              autofocus: true,
              //****************************
              autofillHints: ["@gmail.com","@hotmail.com"],
              enableSuggestions: true,
              //****************************
              // maxLength: 10,
              // buildCounter: (context, {required currentLength,required isFocused, maxLength}) {
              //   return Text('$currentLength :: $maxLength');
              // },
              // minLines: 10,
              //****************************
              // minLines: 1,
              // maxLines: 2,
              //****************************
              minLines: null,
              maxLines: null,
              expands: true,
              //****************************
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  maxHeight:_emailError == null ? 50 : 75
                ),
                //****************************
              // helperText: 'Ex: example@gmail.com',
              //     hintStyle: GoogleFonts.poppins(
              //       color: Colors.black45,
              //       fontSize: 12
              //     ),
                  contentPadding: EdgeInsets.zero,
                  //****************************
                  hintText: 'Email',
                hintStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1,
                  fontSize: 14
                ),
                hintMaxLines: 1,
                hintTextDirection: TextDirection.ltr,
                //****************************
                // labelText: 'Email',
                // labelStyle: GoogleFonts.poppins(
                //     fontWeight: FontWeight.w300,
                //     letterSpacing: 1,
                //     fontSize: 14
                // ),
                // floatingLabelAlignment: FloatingLabelAlignment.start,
                // floatingLabelBehavior: FloatingLabelBehavior.always,
                // floatingLabelStyle: GoogleFonts.poppins(
                //     fontWeight: FontWeight.bold ,
                //     letterSpacing: 1,
                //     fontSize: 14
                // ),
                alignLabelWithHint: false,
                //****************************
                fillColor: Colors.grey,
                filled: false,
                //****************************
                // icon: Icon(Icons.email),
                prefixIcon: Icon(Icons.email,),
                // prefixText: 'email-',
                // prefixStyle: GoogleFonts.poppins(
                //     fontWeight: FontWeight.bold ,
                //     letterSpacing: 1,
                //     fontSize: 14
                // ),
                //****************************
                  // suffixIcon:IconButton(onPressed: (){},icon: Icon(Icons.send),
                // ),
                // suffixText: 'Available',
                // suffixStyle: GoogleFonts.poppins(
                //     fontSize: 14,
                //   color: Colors.grey
                border: UnderlineInputBorder(),
                // focusedBorder: UnderlineInputBorder(
                //   borderRadius: BorderRadius.circular(10),
                //   borderSide: BorderSide(color:Colors.blue.shade800, )
                // )
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey,
                  width: 2,
                  strokeAlign: StrokeAlign.center,
                  style:BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10),

                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade800),
                    borderRadius: BorderRadius.circular(10),

                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red.shade400
                  )
                ),

                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Colors.red.shade800
                    )
                 ),
                errorText: _emailError,



                ),

              ),
            SizedBox(height: 10,),
            TextField(
              style: GoogleFonts.tajawal(),
              controller: _passwordTextController,


              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                  hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1,
                      fontSize: 14
                  ),

                  constraints: BoxConstraints(
                      maxHeight: 70
                  ),
                  contentPadding: EdgeInsets.zero,

                prefixIcon: Icon(Icons.lock),

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey,
                        width: 2,
                        strokeAlign: StrokeAlign.center,
                        style:BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10),

                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade800),
                    borderRadius: BorderRadius.circular(10),

                  ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Colors.red.shade400
                    )
                ),

                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Colors.red.shade800
                    )
                ),
                errorText: _passwordError,
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: ()=> _performLogin(),
                child: Text('Login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),

                minimumSize: Size(double.infinity, 50)
              ),

            ),


          ],
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
      _emailError=_emailTextController.text.isEmpty ? 'Enter email ' : null;
      _passwordError=_passwordTextController.text.isEmpty ? 'Enter password ' : null;
    });

    if(_emailTextController.text.isNotEmpty&&
    _passwordTextController.text.isNotEmpty){
      return true;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('Enter required data'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3),
          dismissDirection: DismissDirection.horizontal,
    ),
    );
    return false;
  }
  void _login(){
    Navigator.pushReplacementNamed(context, '/bottom_navigation_screen');

  }
}
