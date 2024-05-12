import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/controller/wallpaperController.dart';
import 'package:wallpaper_app/utils/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WallPaperController listnable = Provider.of<WallPaperController>(context);
    GlobalKey<FormState> form = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Wallpaper",
              style: TextStyle(
                color: Colors.deepPurple.shade900,
              ),
            ),
            Text(
              "App",
              style: TextStyle(
                color: Colors.orange.shade900,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: form,
              child: TextFormField(
                initialValue: Globals.globals.searchData,
                onSaved: (val) {
                  Globals.globals.searchData = val ?? "natural";
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      form.currentState!.save();
                      listnable.loadData();
                    },
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                  labelText: "Search Wallpaper",
                  labelStyle: TextStyle(
                    color: Colors.blue.shade900,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          ),
          listnable.allWallPaper.isEmpty
              ? const Center(
                  child: Text(
                    "Not Available Any Wallpaper",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: listnable.allWallPaper.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            MyRoutes.setWallpaperPage,
                            arguments: index);
                      },
                      child: Container(
                        height: 200,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                                listnable.allWallPaper[index].largeImageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
