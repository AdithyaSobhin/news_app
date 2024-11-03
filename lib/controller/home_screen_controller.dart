import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/business_news_model.dart';

class HomeScreenController with ChangeNotifier {
  BusinessNewsModel? businessNewsModel;
  List<Article> newsArticles = [];
  bool isLoading = false;

  Future<void> getNewsByCategory(String category) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?category=$category&apiKey=8ad0bf2a0230455986d93722f6d50dd9");

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        businessNewsModel = businessNewsModelFromJson(response.body);
        if (businessNewsModel != null) {
          newsArticles = businessNewsModel!.articles ?? [];
        }
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
