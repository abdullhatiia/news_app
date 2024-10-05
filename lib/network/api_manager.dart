import 'dart:convert';

import 'package:news_app/CORE/config/constans.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/models/sorces_model.dart';
import 'package:http/http.dart' as http;

class ApiManager{


  static Future<List<Source>> fetchSourcesList(String categoryId)async{
    var
    url=Uri.https(
        Constans.domain,
        "/v2/top-headlines/sources",
        {
          "apiKey": Constans.apiKey,
          "category":categoryId,
        }

    );
   final response= await http.get(url);
   if(response.statusCode==200){
    var data= jsonDecode(response.body);
    print(data);
   SourcesModel source= SourcesModel.fromJson(data);

   return source.sources;
   }else{
     throw Exception("Failed To get Sources");
   }

  }
  static Future<List<Article>> fetchDataArticales(String sourceId)async{
    var
    uri=Uri.https(
        Constans.domain,
        "/v2/top-headlines",
        {
          "apiKey": Constans.apiKey,
          "sources":sourceId,
        }

    );
   final response= await http.get(uri);
   if(response.statusCode==200){
    var data= jsonDecode(response.body);
    var Article= ArticlesModel.fromJson(data);

    print(data);

   return Article.articals;
   }else{
     throw Exception("Failed To get articles");
   }

  }

}