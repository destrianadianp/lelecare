import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pengelolaan_lele/firebase_options.dart';
import 'package:pengelolaan_lele/home_page.dart';
import 'package:pengelolaan_lele/informasi_page.dart';
import 'package:pengelolaan_lele/login_page.dart';
import 'package:pengelolaan_lele/panduan_page.dart';
import 'package:pengelolaan_lele/akun_page.dart';
import 'package:pengelolaan_lele/tutorial_page.dart';
import 'package:pengelolaan_lele/peternak_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        "/MyHomePage": (context) => MyHomePage(),
        "/PanduanPage": (context) => PanduanPage(),
        "/InformasiPage": (context) => InformasiPage(),
        "/AkunPage": (context) => AkunPage(),
        "/TutorialPage": (context) => TutorialPage(),
        "/PeternakPage": (context) => PeternakPage(),
        
      },
    );
  }
}
