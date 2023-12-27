import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants/constance.dart';
import 'package:movie_app/controller/home_provider.dart';
import 'package:movie_app/view/pages/widget/movie_slider.dart';
import 'package:movie_app/view/pages/widget/trending_slider.dart';
import 'package:movie_app/widgets/contaner.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "MOVIEMINGLE",
          style: GoogleFonts.abrilFatface(
              fontSize: 30, fontWeight: FontWeight.w800, color: Colors.white),
        ), // Add a title to the app bar
      ),
      body: Stack(children: [
        const AllContainer(),
     
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Trending Movies",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white)),
                const SizedBox(height: 15),

                SizedBox(
                  child: FutureBuilder(
                    future: provider.getHomeDAta(
                        url: Constants.trending, context: context),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }
                       else if (snapshot.hasData) {
                         return TrendingSlider(
                          snapshot: snapshot,
                        );
                      }
                      else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),

                const SizedBox(height: 15),
                Text("Top Rated Movies",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white)),

                SizedBox(
                  child: FutureBuilder(
                    future: provider.getHomeDAta(
                        url: Constants.topRated, context: context),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return MovieSlider(snapshot: snapshot);
                      } 
                       else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),

                Text("Upcoming Movies",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white)),
                const SizedBox(
                  height: 15,
                ),

                SizedBox(
                  child: FutureBuilder(
                    future: provider.getHomeDAta(
                        url: Constants.upComing, context: context),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return MovieSlider(snapshot: snapshot);
                      }
                       else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                Text("Popular Movies",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white)),
                const SizedBox(
                  height: 15,
                ),

                SizedBox(
                  child: FutureBuilder(
                    future: provider.getHomeDAta(
                        url: Constants.popular, context: context),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
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
      ]),
    );
  }
}
