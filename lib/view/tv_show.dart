import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/widgets/contaner.dart';

class TvShowScreen extends StatelessWidget {
  const TvShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
       title: Text("TV SHOW",style: GoogleFonts.aBeeZee(
              fontSize: 30, fontWeight: FontWeight.w800, color: Colors.white),),
       centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Stack(
        children: [
      AllContainer(),
   
       
  ]),
    );
  }
}