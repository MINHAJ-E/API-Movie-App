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
   
        Align(
              alignment: AlignmentDirectional(0,0.1),
              child: ListView.builder(itemCount: 20, itemBuilder: (context, index) => 
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     Container(
                  height: 100,
                  width: 600,
                  decoration: const BoxDecoration(
                 
                    color: Colors.red,
                  ),
                ),
                     Container(
                  height: 100,
                  width: 600,
                  decoration: const BoxDecoration(
                 
                    color: Colors.black
                  ),
                ),
                     Container(
                  height: 100,
                  width: 600,
                  decoration: const BoxDecoration(
                 
                    color: Colors.amber,
                  ),
                ),
                     Container(
                  height: 100,
                  width: 600,
                  decoration: const BoxDecoration(
                 
                    color: Color.fromARGB(255, 64, 251, 80)
                  ),
                ),
                     Container(
                  height: 100,
                  width: 600,
                  decoration: const BoxDecoration(
                 
                    color: Color.fromARGB(255, 64, 251, 80)
                  ),
                ),
                     Container(
                  height: 100,
                  width: 600,
                  decoration: const BoxDecoration(
                 
                    color: Color.fromARGB(255, 64, 251, 80)
                  ),
                ),
                     Container(
                  height: 100,
                  width: 600,
                  decoration: const BoxDecoration(
                 
                    color: Color.fromARGB(255, 64, 251, 80)
                  ),
                ),
                     Container(
                  height: 100,
                  width: 600,
                  decoration: const BoxDecoration(
                 
                    color: Color.fromARGB(255, 64, 251, 80)
                  ),
                ),
                            
                  ],
                ),
              )
              
            ),
  ]),
    );
  }
}