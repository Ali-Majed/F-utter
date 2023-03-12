
import 'package:course_flutter_data_app/controllers/users_db_controller.dart';
import 'package:course_flutter_data_app/models/process_respones.dart';
import 'package:course_flutter_data_app/models/user.dart';
import 'package:course_flutter_data_app/prefs/shared_pref_controller.dart';
import 'package:course_flutter_data_app/provider/language_provider.dart';
import 'package:course_flutter_data_app/utils/context_extenssion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

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
        title: Text(context.localizations.register),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20 ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.localizations.register_title,
              style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),
            ),
            Text(
              context.localizations.register_sub_title,
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
              autofocus: false,
              //****************************
              autofillHints: ["@gmail.com","@hotmail.com"],
              enableSuggestions: true,

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

                contentPadding: EdgeInsets.zero,
                //****************************
                hintText: context.localizations.email,
                hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                    fontSize: 14
                ),
                hintMaxLines: 1,

                alignLabelWithHint: false,
                //****************************
                fillColor: Colors.grey,
                filled: false,
                //****************************
                // icon: Icon(Icons.email),
                prefixIcon: Icon(Icons.email,),

                border: UnderlineInputBorder(),

                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey,
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
            const SizedBox(height: 10,),
            TextField(
              style: GoogleFonts.tajawal(),
              controller: _passwordTextController,


              obscureText: true,
              decoration: InputDecoration(
                hintText: context.localizations.password,
                hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                    fontSize: 14
                ),

                constraints: const BoxConstraints(
                    maxHeight: 70
                ),
                contentPadding: EdgeInsets.zero,

                prefixIcon: Icon(Icons.lock),

                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey,
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
            ElevatedButton(onPressed: ()=> _performRegister(),
              child: Text(context.localizations.register ),
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

  void _performRegister(){
    if(_checkData()){
      _register();
    }
  }
  bool _checkData(){

    setState(() {
      _emailError=_emailTextController.text.isEmpty ? context.localizations.email_error : null;
      _passwordError=_passwordTextController.text.isEmpty ? context.localizations.password_error: null;
    });

    if(_emailTextController.text.isNotEmpty&&
        _passwordTextController.text.isNotEmpty){
      return true;
    }
    context.showSnackBar(context.localizations.error_data,true);

    return false;
  }
  void _register() async{
   ProcessResponse response= await UserDBController().register(user);
   if(response.success)
     Navigator.pop(context);
   context.showSnackBar(response.message,!response.success);
  }

  User get user{

    User user=User();
    user.name="Name";
    user.email=_emailTextController.text;
    user.password=_passwordTextController.text;

    return user;
  }
}
