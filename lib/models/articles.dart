class Articles {
  List <dynamic>articles;
  Articles({this.articles});

  factory Articles.fromJson(Map<String,dynamic>articlesJson){
    return Articles(
      articles: articlesJson['articles'],
    );
  }
}