import 'package:flutter/material.dart';
import 'package:news_app/CORE/theme/colors_palette.dart';
import 'package:news_app/ViewModel/sources_view_model.dart';
import 'package:news_app/features/home/widgets/category_view.dart';
import 'package:news_app/models/category_data.dart';
import 'package:news_app/network/api_manager.dart';
import 'package:provider/provider.dart';

import '../../../models/sorces_model.dart';

class SelectedCategoryView extends StatefulWidget {
  final CategoryData categoryData;

  const SelectedCategoryView({
    super.key,
    required this.categoryData});

  @override
  State<SelectedCategoryView> createState() => _SelectedCategoryViewState();
}

class _SelectedCategoryViewState extends State<SelectedCategoryView> {
  var selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => SourceViewModel()..getSourcesList(widget.categoryData.categoryId),
    child: Consumer<SourceViewModel>(builder: (context,vm,child){
      if(vm.sourcesList.isEmpty){
        return Center(
          child: Text("Waiting To Fitch Data..",
          style: TextStyle(
            fontFamily: "Exo",
            fontWeight: FontWeight.bold,
          ),),
        );
      }
      return CategoryView(sourcesList: vm.sourcesList);
    },),);
    return FutureBuilder<List<Source>>
    (future: ApiManager.fetchSourcesList(widget.categoryData.categoryId),
        builder: (context, snapshot) {
      if(snapshot.hasError){
        return const Text("Error");
      }
      if(snapshot.connectionState==ConnectionState.waiting){

          return Center(
            child: CircularProgressIndicator(
              color: ColorPalette.primaryColor,
            ),
          );
      }
      List<Source> sourceList=snapshot.data??[];

      return CategoryView(sourcesList: sourceList);
        },
    );
  }
}
