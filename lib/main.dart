import 'package:bhivetask/screens/home.dart';
import 'package:bhivetask/screens/referral_section.dart';
import 'package:bhivetask/screens/refferal_dashboard.dart';
import 'package:bhivetask/screens/sign_in.dart';
import 'package:bhivetask/screens/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BHIVE',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(primarySwatch: Colors.orange,
      fontFamily: GoogleFonts.roboto().fontFamily),
      home: SignIn(),

    );
  }
}
