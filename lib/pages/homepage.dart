import 'package:flutter/material.dart';
import 'package:news/models/newsapi.dart';
import 'package:news/services/api_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<News> _news;

  @override
  void initState() {
    _news=API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('News'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: FutureBuilder<News>(
          future: _news,
          builder: (context,snapshot) {
            if(snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.articles.length,
                itemBuilder: (context, index) {

                  var article=snapshot.data.articles[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.teal[300],
                        ),

                      child: ListTile(
                        onTap: (){
                          launch(article.url);
                          //print(article.url);
                        },
                        leading: CircleAvatar(child: Image.network(article.urlToImage),
                        backgroundColor: Colors.black,
                        radius: 35,),
                        title: Text(article.title,
                        style: TextStyle(

                        ),),
                        subtitle: Text(article.content,
                        style: TextStyle(
                            color: Colors.teal[900],
                          fontFamily: 'Dancing'
                        ),),
                      ),
                    ),
                  );
                },
              );
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          }
        ),
      ),
    );
  }
}
