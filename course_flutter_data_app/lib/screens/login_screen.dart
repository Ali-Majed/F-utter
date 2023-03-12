
import 'package:course_flutter_data_app/controllers/users_db_controller.dart';
import 'package:course_flutter_data_app/models/process_respones.dart';
import 'package:course_flutter_data_app/prefs/shared_pref_controller.dart';
import 'package:course_flutter_data_app/provider/language_provider.dart';
import 'package:course_flutter_data_app/utils/context_extenssion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


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
  late String _language;

  @override
  void initState() {
    super.initState();

    _emailTextController=TextEditingController();
    _passwordTextController=TextEditingController();
    _language = SharedPrefController().getValueFor<String>(PrefKeys.language.name) ?? "en";
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
        title: Text(context.localizations.login),
        actions: [
          IconButton(onPressed: (){
            _showLanguageBottomSheet();
          }, icon: Icon(Icons.language))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20 ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.localizations.login_title,
              style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),
            ),
            Text(
              context.localizations.login_sub_title,
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
                hintText: context.localizations.password,
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
              child: Text(context.localizations.login),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),

                  minimumSize: Size(double.infinity, 50)
              ),
              

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(context.localizations.no_account,style: GoogleFonts.poppins(
                    color: Colors.black
                ),),
                TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/register_screen');

                    },
                    child: Text(
                      context.localizations.create_now,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                      ),)
                )
              ],
            )


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
  void _login() async{
     ProcessResponse processResponse= await UserDBController().login(_emailTextController.text, _passwordTextController.text);

     if (processResponse.success){
       Navigator.pushReplacementNamed(context, '/home_screen');

     }
     context.showSnackBar(processResponse.message,!processResponse.success);
  }

  void _showLanguageBottomSheet() async{
   String? selectedLanguage= await showModalBottomSheet<String>(
        context: context,
        builder: (context){

          return StatefulBuilder(builder: (context,setState){
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(context.localizations.change_language,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black
                    ),)
                  ,Text(context.localizations.select,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: Colors.black
                    ),
                  ),
                  Divider(
                    height: 15,
                    color: Colors.black45,
                    thickness: 0.2,
                  ),
                  RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "English",style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                      ),),
                      value: "en",
                      groupValue: _language,
                      onChanged: (value){
                        if(value != null)
                    setState(() =>_language=value);
                    Navigator.pop(context,"en");
                  }),
                  RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "العربية",style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                      ),),
                      value: "ar", groupValue:_language, onChanged: (value){
                    if(value != null)

                    setState(() =>_language=value);
                    Navigator.pop(context,"ar");

                  }),


                ],
              ),
            );

          });

    });

   if(selectedLanguage != null){
     Provider.of<LanguageProvider>(context,listen: false).changeLanguage(selectedLanguage);
   }
  }
}
