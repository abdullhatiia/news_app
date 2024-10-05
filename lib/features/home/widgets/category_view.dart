import 'package:flutter/material.dart';
import 'package:news_app/features/home/widgets/article_list_widget.dart';
import 'package:news_app/features/home/widgets/tab_bar.dart';
import 'package:news_app/models/sorces_model.dart';

class CategoryView extends StatefulWidget {
 final List<Source> sourcesList;
  const CategoryView({super.key,required this.sourcesList});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex=0;
    return Column(
      children: [
        DefaultTabController(
            length: widget.sourcesList.length,
            child: TabBar(
                isScrollable: true,
                indicatorPadding: EdgeInsets.zero,
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                labelPadding: const EdgeInsets.symmetric(horizontal: 6,),
                indicator: const BoxDecoration(),
                dividerColor: Colors.transparent,
                onTap: (index) {
                  setState(() {
                    selectedIndex=index;
                  });
                },
                tabs:widget.sourcesList
                    .map((data) =>
                    TabBarItem(
                        isSelected: selectedIndex== widget.sourcesList.indexOf(data),
                        source: data)).toList())
        ),
        ArticleListWidget(sourseId: widget.sourcesList[selectedIndex].id,)
      ],
    );
  }
}
