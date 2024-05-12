import 'package:flutter/material.dart';
import 'package:wallpaper_app/pages/home_page/home_page.dart';
import 'package:wallpaper_app/pages/set_wallpaper_page/set_wallpaper_page.dart';
import 'package:wallpaper_app/utils/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: MyRoutes.routes,
    );
  }
}
