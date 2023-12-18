import 'package:flutter/material.dart';
import 'package:movie_app/helpers/colors.dart';
import 'package:movie_app/controller/home_provider.dart';
import 'package:movie_app/view/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => HomeProvider(),),
      
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Calours.scaffoldbgColor,
          useMaterial3: true
        ),
        home: HomeScreen(),
      ),
    );
  }
}