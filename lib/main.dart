import 'package:flutter/material.dart';
import 'package:tes_project_1/views/detailcar_view.dart';
import 'package:tes_project_1/views/listcarforrent_view.dart';
import 'package:tes_project_1/views/login_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        // home: WelcomeScreen(),
        home: const Login(),
        routes: {
          '/list-car-for-rent': (context) => const ListCarForRent(),
          '/detail-car': (context) => const DetailCar(),
        }); //2
  }
}
