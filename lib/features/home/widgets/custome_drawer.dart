import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {

   final void Function() onCategoryDrawerClicked;

  const CustomDrawer({
    super.key,
     required this.onCategoryDrawerClicked,
  });



@override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context);
    return Container(
      width: mediaQuery.size.width*0.7,
      color: Colors.white,

      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: mediaQuery.size.height*0.2,
            width: double.infinity,
            color: Colors.green,
            child: const Text("News App!",
            style: TextStyle(
              fontSize: 24,
              fontFamily: "Exo",
              fontWeight: FontWeight.bold,
              color: Colors.white

            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                onCategoryDrawerClicked() ;

            },
              child: const Row(children: [
                Icon(Icons.list,size: 50,color: Colors.black,),
                SizedBox(width: 10,),
                Text("Categories",
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Exo",
                      fontWeight: FontWeight.bold,
                      color: Colors.black

                  ),),
              ],),
            ),
          ),
          Padding(
            padding:  const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {

              },
              child: const Row(children: [
                Icon(Icons.settings,size: 50,color: Colors.black,),
                SizedBox(width: 10,),

                Text("Settings",
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Exo",
                      fontWeight: FontWeight.bold,
                      color: Colors.black

                  ),),
              ],),
            ),
          )
        ],
      ),
    );
  }

}
