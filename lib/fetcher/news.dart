import 'dart:convert';
import 'dart:ffi';

import 'package:updt/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];
  
  Future<Void?> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=2a1e94724533441684c7a61f22b997fe";

  var response = await http.get(Uri.parse(url));
  var jsonData = jsonDecode(response.body);

  if(jsonData['status'] == 'ok' ){
    jsonData["articles"].forEach((element){
      if(element["urlToImage"] != null && element["description"] != null){
        ArticleModel articleModel = ArticleModel(
          title: element['title'],
          description:  element['description'],
          url: element['url'],
          urlToImage: element['urlToImage'],
          content: element['context'],
        );
        news.add(articleModel);
      }
    });
  }

  }
}

class CategoryNewsClass{
  List<ArticleModel> news = [];
  
  Future<Void?> getNews(String category) async{
    String url = "https://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=2a1e94724533441684c7a61f22b997fe";

  var response = await http.get(Uri.parse(url));
  var jsonData = jsonDecode(response.body);

  if(jsonData['status'] == 'ok' ){
    jsonData["articles"].forEach((element){
      if(element["urlToImage"] != null && element["description"] != null){
        ArticleModel articleModel = ArticleModel(
          title: element['title'],
          description:  element['description'],
          url: element['url'],
          urlToImage: element['urlToImage'],
          content: element['context'],
        );
        news.add(articleModel);
      }
    });
  }

  }
}