import 'package:flutter/material.dart';
import 'package:movie_app/controller/cast_provider.dart';
import 'package:movie_app/controller/home_provider.dart';
import 'package:movie_app/controller/search_provider.dart';
import 'package:movie_app/helpers/colors.dart';
import 'package:movie_app/controller/bottom_bar_provider.dart';
import 'package:movie_app/view/splashpage/splash_screen.dart';
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
        ChangeNotifierProvider(create: (context) => SearchProvider(),),
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
        // ChangeNotifierProvider(create: (context) => CastProvider(),),
      
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Calours.scaffoldbgColor
        ),
        home:const SplashScreen(),
      ),
    );
  }
}