import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/app.dart';
import 'package:wallpaper_app/controller/wallpaperController.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WallPaperController(),
        ),
      ],
      child: MyApp(),
    ),
  );
}
