import 'package:flutter/material.dart';
import 'package:news_app/features/home/widgets/selected_category_view.dart';
import 'package:news_app/features/home/widgets/category_item_widget.dart';
import '../../../models/category_data.dart';
import '../widgets/custome_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<CategoryData> catecoriesDataList = [
    CategoryData(
        categoryId: "sports",
        categoryName: "Sports",
        categoryImage: "assets/icons/sports.png",
        categoryBackgroundColor: const Color(0xffC91C22)),
    CategoryData(
        categoryId: "general",
        categoryName: "Politics",
        categoryImage: "assets/icons/Politics.png",
        categoryBackgroundColor: const Color(0xff003E90)),
    CategoryData(
        categoryId: "health",
        categoryName: "Health",
        categoryImage: "assets/icons/health.png",
        categoryBackgroundColor: const Color(0xffED1E79)),
    CategoryData(
        categoryId: "business",
        categoryName: "business",
        categoryImage: 'assets/icons/bussines.png',
        categoryBackgroundColor: const Color(0xffCF7E48)),
    CategoryData(
        categoryId: "environment",
        categoryName: "Environment",
        categoryImage: "assets/icons/environment.png",
        categoryBackgroundColor: const Color(0xff4882CF)),
    CategoryData(
        categoryId: "science",
        categoryName: "Science",
        categoryImage: "assets/icons/science.png",
        categoryBackgroundColor: const Color(0xffF2D352)),

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
      const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage("assets/images/pattern.png"),
          fit: BoxFit.cover,
        ),

      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(selectedcategory == null ? "News App" : selectedcategory!
              .categoryName,),
          actions: [
            if(selectedcategory != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: IconButton(onPressed: () {

                },
                    icon: const Icon(
                      Icons.search_rounded, size: 40, color: Colors.white,)),
              )
          ],

        ),
        drawer: CustomDrawer(
          onCategoryDrawerClicked: onCategoryDrawerClicked,
        ),
        body: selectedcategory == null ? Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Pick your category \n of interest",
                style: TextStyle(
                  fontFamily: "Exo",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4F5A69),
                ),),
              Expanded(

                child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.85,),
                  itemBuilder: (context, index) =>
                      CategoryItemWidget(
                        oncategoryClicked: oncategoryClick
                        ,
                        index: index,
                        categoryData: catecoriesDataList[index],
                      ),
                  itemCount: catecoriesDataList.length,),
              )
            ],
          ),
        ) : SelectedCategoryView(categoryData: selectedcategory!,),
      ),
    );
  }

  CategoryData? selectedcategory;

  void oncategoryClick
      (CategoryData data) {
    setState(() {
      selectedcategory = data;
    });
  }

  void onCategoryDrawerClicked() {
    setState(() {
      selectedcategory = null;
    });
    Navigator.pop(context);
  }
}
