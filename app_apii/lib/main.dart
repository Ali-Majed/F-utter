import 'package:app_apii/pref/shared_pref_controller.dart';
import 'package:app_apii/provider/language_provider.dart';
import 'package:app_apii/screen/bottom_navigation/bottom_navigation_screen.dart';
import 'package:app_apii/screen/bottom_navigation/images/images_screen.dart';
import 'package:app_apii/screen/bottom_navigation/images/upload_image_screen.dart';
import 'package:app_apii/screen/bottom_navigation/tasks/craete_task_screen.dart';
import 'package:app_apii/screen/bottom_navigation/tasks/tasks_screen.dart';
import 'package:app_apii/screen/bottom_navigation/tasks/update_task_screen.dart';
import 'package:app_apii/screen/launch_screen.dart';
import 'package:app_apii/screen/login_screen.dart';
import 'package:app_apii/screen/register_screen.dart';
import 'package:app_apii/screen/bottom_navigation/users_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LanguageProvider>(
            create: (context) => LanguageProvider(),
          ),
          // Other providers as needed
        ],
        builder: (context, child) {
          // No longer throws
          return MaterialApp(
            theme: ThemeData(
                appBarTheme: AppBarTheme(
              backgroundColor: Color(0xff1f005c),
            )),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(Provider.of<LanguageProvider>(context).language),
            initialRoute: '/launch_screen',
            routes: {
              '/launch_screen': (context) => const LaunchScreen(),
              '/users_screen': (context) => const UserScreen(),
              '/login_screen': (context) => const LoginScreen(),
              '/register_screen': (context) => const RegisterScreen(),
              '/upload_image_screen': (context) => const UploadImageScreen(),
              '/images_screen': (context) => const ImagesSrceen(),
              '/create_task_screen': (context) => const CreateTaskScreen(),
              '/task_screen': (context) => const TasksScreen(),
              '/update_task_screen': (context) => const UpdateTaskScreen(),
              '/navigation_screen': (context) => const BottomNavigationScreen(),
            },
          );
        });
  }
}
