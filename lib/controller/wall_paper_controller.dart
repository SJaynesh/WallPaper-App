import 'package:flutter/material.dart';
import 'package:wallpaper_app/models/wall_paper_model.dart';
import 'package:wallpaper_app/utills/helper/api_helper.dart';

class WallPaperController extends ChangeNotifier {
  String search = "";

  Future<List<Hit>> getWallPaper() async {
    return await APIHelper.apiHelper.getWallPaper(search: search) ?? [];
  }

  void getSearchData({required String search}) {
    this.search = search;
    notifyListeners();
  }
}
