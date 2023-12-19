import 'package:flutter/material.dart';
import 'package:movie_app/controller/search_provider.dart';
import 'package:movie_app/helpers/colors.dart';
import 'package:movie_app/controller/bottom_bar_provider.dart';
import 'package:movie_app/view/home_screen.dart';
import 'package:movie_app/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomBarProvider(),),
        // ChangeNotifierProvider(create: (context) => SearchProvider(),),
      
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Calours.scaffoldbgColor
        ),
        home:const BottomBar(),
      ),
    );
  }
}