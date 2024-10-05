import 'package:flutter/material.dart';
import 'package:news_app/network/api_manager.dart';

import '../models/articles_model.dart';

class ArticleViewModel extends ChangeNotifier{
  List<Article> _articlesList=[];
  List<Article> get articlesList=>_articlesList;


  Future getArticlesList(String sourceId)async{

    _articlesList=  await ApiManager.fetchDataArticales(sourceId);
    notifyListeners();
  }


}