
import 'package:flutter/material.dart';
import 'package:news_app/models/articles_model.dart';

class ArticleItemWidget extends StatelessWidget {
  final Article article;
  const ArticleItemWidget({super.key,
  required this.article
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context);
    var theme=Theme.of(context);
    return GestureDetector(
      onTap: () {

      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
             height: 230,
            width: mediaQuery.size.width,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Image.network(article.urlImagre,),


          ),
          SizedBox(height: 8,),
          Text(
            article.auther,
            textAlign: TextAlign.start,
            style: theme.textTheme.bodySmall?.copyWith(
              color: Color(0xff79828B),
            ),

          ),
          SizedBox(height: 4,),
          Text(
            article.title,
            textAlign: TextAlign.start,
            style: theme.textTheme.bodySmall?.copyWith(
              color: Color(0xff42505C),
              fontSize: 18,
              height: 1.1,

            ),

          ),
        ],
      ),
    );
  }
}
