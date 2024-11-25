import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/controller/wall_paper_controller.dart';
import 'package:wallpaper_app/models/wall_paper_model.dart';

TextEditingController searchController = TextEditingController();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "4K Wall Paper",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: "Search",
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: FloatingActionButton(
                    onPressed: () {
                      log("Search btn is tapped...");
                      // image = searchController.text;
                      Provider.of<WallPaperController>(context, listen: false)
                          .getSearchData(search: searchController.text);
                    },
                    child: const Icon(Icons.search),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Consumer<WallPaperController>(
                  builder: (context, provider, _) {
                return FutureBuilder(
                  future: provider.getWallPaper(),
                  builder: (BuildContext context, AsyncSnapshot snapShot) {
                    if (snapShot.hasError) {
                      return Center(
                        child: Text("ERROR : ${snapShot.error}"),
                      );
                    } else if (snapShot.hasData) {
                      List<Hit> wallPaper = snapShot.data;
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: NetworkImage(
                                wallPaper[index].largeImageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        itemCount: wallPaper.length,
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
