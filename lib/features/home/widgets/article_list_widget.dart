import 'package:flutter/material.dart';
import 'package:news_app/CORE/theme/colors_palette.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/models/sorces_model.dart';
import 'package:news_app/network/api_manager.dart';

import 'article_item_widget.dart';

class ArticleListWidget extends StatelessWidget {
  final String sourseId;
  const ArticleListWidget({super.key,
  required this.sourseId});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return FutureBuilder<List<Article>>(
        future: ApiManager.fetchDataArticales(sourseId),
      builder: (context,snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text("Error Fetching Articles",
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Colors.black,
              ),),
            );
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            Center(
              child: CircularProgressIndicator(
                color: theme.primaryColor,
              ),
            );
          }
          var articlesList=snapshot.data??[];
          return Expanded(child:
          ListView.builder(itemBuilder: (context,index)=>ArticleItemWidget(article:articlesList[index]),
            itemCount: articlesList.length,
          )
          );
      },
    );
  }
}
