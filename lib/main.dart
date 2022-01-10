// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_io/models/productsVM.dart';
import 'package:product_io/routes.dart';
import 'package:product_io/views/on_board.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsVM(),
        ),
      ],
      child: MaterialApp(
        title: 'Product IO',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.white10,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        ),
        initialRoute: OnBoard.id,
        routes: routes,
      ),
    );
  }
}
