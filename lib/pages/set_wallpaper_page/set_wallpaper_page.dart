import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/wallpaperController.dart';

class SetWallPaper extends StatelessWidget {
  const SetWallPaper({super.key});

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    WallPaperController listnable = Provider.of<WallPaperController>(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    NetworkImage(listnable.allWallPaper[index].largeImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.8),
            child: OutlinedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Set as wallpaper"),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          await AsyncWallpaper.setWallpaper(
                            url: listnable.allWallPaper[index].largeImageUrl,
                            wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
                            goToHome: true,
                          );
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text("HomePage"),
                      ),
                      TextButton(
                        onPressed: () async {
                          await AsyncWallpaper.setWallpaper(
                            url: listnable.allWallPaper[index].largeImageUrl,
                            wallpaperLocation: AsyncWallpaper.LOCK_SCREEN,
                            goToHome: true,
                          );
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text("Lock screen"),
                      ),
                      TextButton(
                        onPressed: () async {
                          await AsyncWallpaper.setWallpaper(
                            url: listnable.allWallPaper[index].largeImageUrl,
                            wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
                            goToHome: true,
                          );
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text("Lock and Home screens"),
                      ),
                    ],
                  ),
                );
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.black,
                ),
              ),
              child: const Text(
                "Set WallPaper",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
