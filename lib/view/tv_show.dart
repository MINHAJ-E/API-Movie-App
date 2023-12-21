import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants/constance.dart';
import 'package:movie_app/controller/home_provider.dart';
import 'package:movie_app/services/api_services.dart';
import 'package:movie_app/widgets/contaner.dart';
import 'package:movie_app/widgets/movie_slider.dart';
import 'package:provider/provider.dart';

class TvShowScreen extends StatelessWidget {
  const TvShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final provider = Provider.of<HomeProvider>(context);
    return Scaffold(
        backgroundColor: Colors.black,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "TV SHOW",
            style: GoogleFonts.aBeeZee(
                fontSize: 30, fontWeight: FontWeight.w800, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          ),
        ),
        body:     Stack(
          children: [
            AllContainer(),
           SingleChildScrollView(
            child: SizedBox(
              
                 
                  // MovieSlider(),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                            Text("Popular TV Shows", style:GoogleFonts.aBeeZee(
                fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),),
                SizedBox(height: 10,),
                          FutureBuilder(
                            future:provider .getHomeDAta(url: Constants.tvPopular),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              } else if (snapshot.hasData) {
                                // final data = snapshot.data;
                                return MovieSlider(snapshot: snapshot);
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                          SizedBox(height: 10,),
                            Text("Top Rated TV Shows",style:GoogleFonts.aBeeZee(
                fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white)),
                SizedBox(height: 10,),
                          FutureBuilder(
                            future: provider .getHomeDAta(url: Constants.tvTopRated),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              } else if (snapshot.hasData) {
                                // final data = snapshot.data;
                                return MovieSlider(snapshot: snapshot);
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                          SizedBox(height: 10,),
                            Text("On the Air TV show",style:GoogleFonts.aBeeZee(
                fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white)),
                SizedBox(height: 10,),
                          FutureBuilder(
                            future:provider .getHomeDAta(url: Constants.tvOntheAir),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              } else if (snapshot.hasData) {
                                // final data = snapshot.data;
                                return MovieSlider(snapshot: snapshot);
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
              ),
      ]  ));
  }
}
