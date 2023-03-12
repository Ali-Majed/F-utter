import 'package:app_apii/api/controllers/auth_api_controller.dart';
import 'package:app_apii/models/api_response.dart';
import 'package:app_apii/pref/shared_pref_controller.dart';
import 'package:app_apii/provider/language_provider.dart';
import 'package:app_apii/utils/context_extenssion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _emailLegnth = 0;

  String? _emailErorr;
  String? _passwordErorr;
  late String _language;


  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _language = SharedPrefController().getValueFor<String>(key:PrefKey.language.name) ?? "en";

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
        title:  Text(context.localizations.login),
        actions: [
          IconButton(onPressed: (){
            _showLanguageBottomSheet();
          }, icon: Icon(Icons.language))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.localizations.login_title,
              style: GoogleFonts.tajawal(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color(0xff53023a)
              ),
            ),
            Text(
              context.localizations.login_sub_title,
              style: GoogleFonts.tajawal(
                fontWeight: FontWeight.w300,
                color: Colors.black45,
                fontSize: 16,
                height: 0.6,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailTextController,
              style: GoogleFonts.poppins(),
              keyboardType: TextInputType.emailAddress,

              enabled: true,

              autofillHints: ['@gmail.com', 'hotmail.com'],
              enableSuggestions: true,

              minLines: null,
              maxLines: null,
              expands: true,

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
                fillColor: Colors.grey,
                filled: false,
                helperMaxLines: 1,
                helperStyle:
                    GoogleFonts.poppins(color: Colors.black45, fontSize: 12),
                enabled: false,
                prefixIcon: Icon(Icons.email,color: Color(0xffca485c),),
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
                prefixIcon: Icon(Icons.lock,color: Color(0xffca485c),),
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _performLogin(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff870160),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(context.localizations.login),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(context.localizations.no_account),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register_screen');
                  },
                  child: Text(context.localizations.create_now,style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffac255e)
                  ),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _performLogin() async {
    if (_checkData()) {
      await _login();
    }
  }

  bool _checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(message:  context.localizations.error_data, error: true);
    return false;
  }

  Future<void> _login() async {
    ApiResponse apiResponse = await AuthApiController()
        .login(_emailTextController.text, _passwordTextController.text);
    if (apiResponse.success) {
      Navigator.pushReplacementNamed(context, '/navigation_screen');
    }
    context.showSnackBar(
        message: apiResponse.message, error: !apiResponse.success);
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
