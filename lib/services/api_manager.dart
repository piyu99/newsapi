import 'dart:convert';
import 'package:news/models/newsapi.dart';
import 'package:http/http.dart' as http;
import 'package:news/strings/strings.dart';


class API_Manager  {

  Future<News> getNews() async {
    var news=null;

    var client =http.Client();

    try {
      var response = await client.get(Strings.API_url);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        news = News.fromJson(jsonMap);
      }
    }
    catch(Exception){
      return news;
    }

    return news;
  }

}