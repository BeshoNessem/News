class Article{
  final String title ;
  final String imageurl;
  final String description;
  final String url;
  Article({this.title,this.imageurl,this.description,this.url});

  factory Article.fromJson(Map<String,dynamic>jsonArticle){
    return Article(
      title: jsonArticle['title'],
      imageurl: jsonArticle['urlToImage'],
      description: jsonArticle['description'],
      url: jsonArticle['url'],
    );
  }
}