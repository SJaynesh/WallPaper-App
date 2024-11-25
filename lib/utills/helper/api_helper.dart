import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app/models/wall_paper_model.dart';

class APIHelper {
  APIHelper._();

  static APIHelper apiHelper = APIHelper._();

  // Todo : Wallpaper API call

  Future<List<Hit>?> getWallPaper({required String search}) async {
    String apiKey = "47197584-69e542ae256d7d78ce1f21b38";
    Uri url = Uri.parse(
        "https://pixabay.com/api/?key=$apiKey&q=$search&image_type=photo&orientation=vertical");

    http.Response res = await http.get(url);

    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);

      WallPaperModel wallPaperData = WallPaperModel.fromJson(json: data);

      return wallPaperData.hits;
    }
    return null;
  }
}
