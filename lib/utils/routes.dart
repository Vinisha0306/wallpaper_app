import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/pages/home_page/home_page.dart';
import 'package:wallpaper_app/pages/set_wallpaper_page/set_wallpaper_page.dart';

class MyRoutes {
  static String homePage = '/';
  static String setWallpaperPage = 'setwallpaper';

  static Map<String, WidgetBuilder> routes = {
    homePage: (context) => const HomePage(),
    setWallpaperPage: (context) => const SetWallPaper(),
  };
}

class Globals {
  String searchData = 'natural';
  static Globals globals = Globals();
}
