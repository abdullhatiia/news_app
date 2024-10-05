import 'package:flutter/cupertino.dart';
import 'package:news_app/network/api_manager.dart';

import '../models/sorces_model.dart';

class SourceViewModel extends ChangeNotifier{
List<Source> _sourcesList=[];
List<Source> get sourcesList=>_sourcesList;
Future getSourcesList(categoryId)async{
  _sourcesList=await ApiManager.fetchSourcesList(categoryId);
  notifyListeners();
}
}
