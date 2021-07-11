import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//importa o google fonts para o dev utilizar a fonte que achar melhor no projeto final
//para isto, foi inserido em pubspec.yaml a versão do google fonts utilizada
import 'package:todo1/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //remove o aviso de debug do emulador mobile
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Homepage(),
    );
  }
}
