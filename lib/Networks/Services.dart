import 'dart:convert';

import 'package:http/http.dart' as http ;
import 'package:news/models/article.dart';
import 'package:news/models/articles.dart';
class Services{
  String url ="https://newsapi.org/v2/top-headlines?country=eg&apiKey=1dbc662131704b54927a76ccfab61326";
  Future<List<Article>> fetchArticles() async{
    http.Response response = await http.get(url);
    try{
      if(response.statusCode==200){
        var jsonData=jsonDecode(response.body);
        Articles articles = Articles.fromJson(jsonData);
        List<Article> articlesList=articles.articles.map((e) => Article.fromJson(e)).toList();
        return articlesList;
      }else {
        print("error can't load data!!");
      }

    } catch (e){
      print(e.toString());
    }
  }
}