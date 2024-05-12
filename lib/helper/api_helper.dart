import 'dart:convert';
import 'package:wallpaper_app/utils/routes.dart';

import '../modal/wallpaperModal.dart';
import 'package:http/http.dart' as http;

class WallPaperApi {
  WallPaperApi._();

  static WallPaperApi wallPaperApi = WallPaperApi._();

  String api =
      "https://pixabay.com/api/?key=43147754-7be605e9af5bfcca0a0db3dbe&orientation=vertical&q=${Globals.globals.searchData}";

  Future<List<WallPaper>> getWallPaper() async {
    List<WallPaper> allWallPaper = [];
    api =
        "https://pixabay.com/api/?key=43147754-7be605e9af5bfcca0a0db3dbe&orientation=vertical&q=${Globals.globals.searchData}";

    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      print("print : ${Globals.globals.searchData}");

      Map data = jsonDecode(response.body);
      List allData = data['hits'];
      allWallPaper = allData.map((e) => WallPaper.fromJson(e)).toList();
    }
    print("print : ${response.statusCode}");
    return allWallPaper;
  }
}
