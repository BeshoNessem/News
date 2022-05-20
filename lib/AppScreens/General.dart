import 'package:flutter/material.dart';
import 'package:news/Networks/Services.dart';
import 'package:news/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class General extends StatefulWidget {
  @override
  _GeneralState createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  List<Article> articles = [];
  Services services = Services();

  getData() async {
    List<Article> article = await services.fetchArticles();
    setState(() {
      articles = article;
    });
  }

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text("News"),
        ),
        body:
            articles.isEmpty?Center(child: CircularProgressIndicator(),):
        ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.cyan,
                child: Column(
                  children: [
                    Container(
                      width: screenwidth,
                      height: screenheight * .15,
                      child: Text(
                        articles[index].title,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            decoration: TextDecoration.underline),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: screenheight * 0.3,
                      width: screenwidth,
                      child: articles[index].imageurl == null
                          ? Center(
                              child: Text("No Image"),
                            )
                          : Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(articles[index].imageurl),
                            ),
                    ),
                    Container(
                        height: screenheight * 0.3,
                        width: screenwidth,
                        child: Text(
                          articles[index].description,
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 18),
                        )),
                    Container(
                      color: Colors.black,
                      width: screenwidth,
                      height: screenheight * 0.05,
                      child: FlatButton(
                        child: Text(
                          "Read more >>",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.black,
                        onPressed: () async {
                          try {
                            canLaunch(articles[index].url);
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
