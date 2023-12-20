import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants/constance.dart';
import 'package:movie_app/model/model.dart';
import 'package:movie_app/services/api_services.dart';
import 'package:movie_app/widgets/movie_slider.dart';
import 'package:movie_app/widgets/trending_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late Future<List<Movie>> trendingMovies;
  // late Future<List<Movie>> topRatedMovies;
  // late Future<List<Movie>> upcomingMovies;
  // late Future<List<Movie>> latestMovies;

  @override
  void initState() {
    super.initState();
    // trendingMovies = ApiServices().getMovies(apiUrl: Constants.trending);
    // topRatedMovies = ApiServices().getTopRatedMovies();
    // upcomingMovies = ApiServices().getUpcomingMovies();
    // latestMovies = ApiServices().getLatest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "NETFLIX",
          style: GoogleFonts.abrilFatface(
              fontSize: 30, fontWeight: FontWeight.w800, color: Colors.red),
        ), // Add a title to the app bar
      ),
      body: Stack(
        children: [
             Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
          Color(0xff1f005c),
              Color(0xff5b0060),
              Colors.black
              // Color(0xff870160),
              // Color(0xffac255e),
              // Color(0xffca485c),
              // Color(0xffe16b5c),
              // Color(0xfff39060),
              // Color(0xffffb56b),
              ],
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
            child: Container(
              decoration: const BoxDecoration(color: Colors.transparent),
            ),
          ),
          
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Text("Trending Movies", style:GoogleFonts.aBeeZee(
                fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white)),
                const SizedBox(height: 15),
                // TrendingSlider(),
        
                SizedBox(
                  child: FutureBuilder(
                    future:ApiServices().getMovies(apiUrl: Constants.trending),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        // final data = snapshot.data;
                        return TrendingSlider(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
        
                const SizedBox(height: 15),
                 Text("Top Rated Movies", style:GoogleFonts.aBeeZee(
                fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white)),
                // MovieSlider(),
        
                SizedBox(
                  child: FutureBuilder(
                    future: ApiServices().getMovies(apiUrl: Constants.topRated),
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
                ),
        
                 Text("Upcoming Movies", style:GoogleFonts.aBeeZee(
                fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white)),
                const SizedBox(
                  height: 15,
                ),
                // MovieSlider(),
        
                SizedBox(
                  child: FutureBuilder(
                    future: ApiServices().getMovies(apiUrl: Constants.upComing),
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
                ),
                 Text("Popular Movies",style:GoogleFonts.aBeeZee(
                fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white)),
                const SizedBox(
                  height: 15,
                ),
                // MovieSlider(snapshot: null,),
        
                SizedBox(
                  child: FutureBuilder<List<Movie>>(
                    future:  ApiServices().getMovies(apiUrl: Constants.popular),
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
                ),
              ],
            ),
          ),
        ),
    ]  ),
    );
  }
}
