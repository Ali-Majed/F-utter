import 'package:course_flutter_data_app/database/db_controller.dart';
import 'package:course_flutter_data_app/provider/language_provider.dart';
import 'package:course_flutter_data_app/provider/note_provider.dart';
import 'package:course_flutter_data_app/screens/home_screen.dart';
import 'package:course_flutter_data_app/screens/launch_screen.dart';
import 'package:course_flutter_data_app/screens/login_screen.dart';
import 'package:course_flutter_data_app/screens/note_screen.dart';
import 'package:course_flutter_data_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:course_flutter_data_app/prefs/shared_pref_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
  await DBController().initDatabase();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LanguageProvider(),
        )
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  iconTheme: const IconThemeData(color: Colors.black45),
                  titleTextStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15))),

          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,

          // localizationsDelegates: const [
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          //   AppLocalizations.delegate
          // ],
          // supportedLocales: [
          //   Locale('en'),
          //   Locale('ar')
          // ],

          locale: Locale(Provider.of<LanguageProvider>(context).language),

          initialRoute: "/launch_screen",
          routes: {
            '/launch_screen': (context) => const LaunchScreen(),
            '/login_screen': (context) => const LoginScreen(),
            '/home_screen': (context) => const HomeScreen(),
            '/register_screen': (context) => const RegisterScreen(),
            '/note_screen': (context) => const NoteScreen(),
          },
        );
      },
    );
  }
}
