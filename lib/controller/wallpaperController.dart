import 'package:flutter/material.dart';
import 'package:wallpaper_app/helper/api_helper.dart';
import '../modal/wallpaperModal.dart';

class WallPaperController extends ChangeNotifier {
  List<WallPaper> allWallPaper = [];

  WallPaperController() {
    loadData();
  }

  Future<void> loadData() async {
    allWallPaper = await WallPaperApi.wallPaperApi.getWallPaper();
    notifyListeners();
  }
}
