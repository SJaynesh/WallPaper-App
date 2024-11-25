class WallPaperModel {
  List<Hit> hits;

  WallPaperModel({
    required this.hits,
  });

  factory WallPaperModel.fromJson({required Map<String, dynamic> json}) =>
      WallPaperModel(
        hits: List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
      );
}

class Hit {
  String pageUrl;
  String type;
  String tags;
  String largeImageUrl;
  int views;
  int downloads;
  int collections;
  int likes;
  int comments;
  int userId;
  String user;
  String userImageUrl;

  Hit({
    required this.pageUrl,
    required this.type,
    required this.tags,
    required this.largeImageUrl,
    required this.views,
    required this.downloads,
    required this.collections,
    required this.likes,
    required this.comments,
    required this.userId,
    required this.user,
    required this.userImageUrl,
  });

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        pageUrl: json["pageURL"],
        type: json["type"],
        tags: json["tags"],
        largeImageUrl: json["largeImageURL"],
        views: json["views"],
        downloads: json["downloads"],
        collections: json["collections"],
        likes: json["likes"],
        comments: json["comments"],
        userId: json["user_id"],
        user: json["user"],
        userImageUrl: json["userImageURL"],
      );
}
