import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/core/config/page_routes_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds:3),
          (){
        Navigator.pushReplacementNamed(
            context,
            PageRoutesName.homeView) ;

      },
    );
    super.initState();
  }

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
      child: Center(child: Image.asset("assets/icons/logo.png")),


    );

  }
}