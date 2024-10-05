class ArticlesModel{

  final String status;
  final List<Article> articals;

  ArticlesModel({
    required this.status,
    required this.articals});

  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    return ArticlesModel(
      status: json["status"],
      articals: List.from(json["articals"])
          .map((i) => Article.fromJson(i) )
          .toList(),
    );
  }
//
}
class Article{

  final String auther;
  final String title;
  final String describtion;
  final String url;
  final String urlImagre;
  final String publishedAt;

  Article(
      {
       required this.auther,
      required this.title,
      required this.describtion,
      required this.url,
      required this.urlImagre,
      required this.publishedAt});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      auther: json["source"]["name"],
      title: json["title"],
      describtion: json["describtion"],
      url: json["url"],
      urlImagre: json["urlToImagre"],
      publishedAt: json["publishedAt"],
    );
  }
//
}
