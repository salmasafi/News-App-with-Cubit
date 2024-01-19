// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:newsapp/objects/news_model.dart';

class NewsService{
  Dio dio = Dio();

  Future<List<NewsModel>> getNews({required String categoryOption}) async {
    Response response = await dio.get('https://newsapi.org/v2/top-headlines?apiKey=b1c3ba7a86fb4927aca104fac423140d&country=us&category=$categoryOption');
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['articles'];

    List<NewsModel> newsList = [];

    for (var article in articles) {
      String image;
      String title;
      String subtitle;
      
      if (article['urlToImage'] == null) {
        image = 'https://st3.depositphotos.com/11245678/36021/i/450/depositphotos_360215620-stock-photo-breaking-news-rendering-virtual-set.jpg';
      }
      else{
        image = article['urlToImage'];
      }

      if (article['title'] == null) {
        title = 'No title';
      }
      else{
        title = article['title'];
      }

      if (article['description'] == null) {
        subtitle = title;
      }
      else{
        subtitle = article['description'];
      }

      newsList.add(NewsModel(image: image, title: title, subtitle: subtitle));

    }
    return newsList;
  }
}