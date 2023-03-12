import 'package:course_flutter_firebase/bloc/bloc/images_bloc.dart';
import 'package:course_flutter_firebase/bloc/states/crud_state.dart';
import 'package:course_flutter_firebase/pref/shared_pref_controller.dart';
import 'package:course_flutter_firebase/provider/language_provider.dart';
import 'package:course_flutter_firebase/screens/auth/register_screen.dart';
import 'package:course_flutter_firebase/screens/bottom_navigation/bottom_navigation_screen.dart';
import 'package:course_flutter_firebase/screens/firestore/home_screen.dart';
import 'package:course_flutter_firebase/screens/firestore/note_screen.dart';
import 'package:course_flutter_firebase/screens/launch_screen.dart';
import 'package:course_flutter_firebase/screens/auth/login_screen.dart';
import 'package:course_flutter_firebase/screens/storage/images_screen.dart';
import 'package:course_flutter_firebase/screens/storage/upload_image_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ImagesBloc(LoadingState()),)
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<LanguageProvider>(
            create: (context) => LanguageProvider(),
          ),
        ],
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:ThemeData(
                appBarTheme: AppBarTheme(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    iconTheme: IconThemeData(color: Colors.black),
                    titleTextStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    )

                )
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(Provider.of<LanguageProvider>(context).language),
            initialRoute: "/launch_screen",
            routes: {
              '/launch_screen': (context) => const LaunchScreen(),
              '/login_screen': (context) => const LoginScreen(),
              '/register_screen': (context) => const RegisterScreen(),
              '/home_screen': (context) => const HomeScreen(),
              '/note_screen': (context) => const NoteScreen(),
              '/images_screen': (context) => const ImagesSrceen(),
              '/upload_image_screen': (context) => const UploadImageScreen(),
              '/navigation_screen': (context) => const BottomNavigationScreen(),

            },
          );
        },
      ),
    );
  }
}
