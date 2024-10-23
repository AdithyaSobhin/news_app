import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/business_news_model.dart';

class SearchScreenController with ChangeNotifier {
  BusinessNewsModel? newsResModel;
  List<Article> newsArticles = [];
  bool isLoading = false;

  Future<void> onSearch(String keyWord) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$keyWord&apiKey=742488509a4f4f23b93e7ac3afc24cad");
    try {
      var res = await http.get(url);
      if (res.statusCode == 200) {
        newsResModel = businessNewsModelFromJson(res.body);
        if (newsResModel != null) {
          newsArticles = newsResModel!.articles ?? [];
        }
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
