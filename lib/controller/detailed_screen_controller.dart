import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/business_news_model.dart';

class DetailedScreenController with ChangeNotifier {
  BusinessNewsModel? selectedArticle;
  bool isLoading = false;

  Future<void> getDetailedNews(String articleUrl) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse(articleUrl);

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        selectedArticle = singleNewsModelFromJson(response.body);
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }

  void setSelectedArticle(BusinessNewsModel article) {
    selectedArticle = article;
    notifyListeners();
  }
}
