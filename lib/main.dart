import 'package:flutter/material.dart';
import 'package:news_app/core/config/app_router.dart';
import 'package:news_app/core/config/page_routes_name.dart';
import 'package:news_app/core/theme/app_theme_manager.dart';

void main() {
  runApp(const MyApp());

  // ApiManager.fetchSourcesList("sports");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News_App',
     theme: AppTemeManager.themeData,
     initialRoute: PageRoutesName.initial,
     onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}

