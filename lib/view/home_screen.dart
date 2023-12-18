import 'package:flutter/material.dart';
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


  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upcomingMovies;


  void initState() {
    super.initState();
    trendingMovies=ApiServices().getTrendingMovies();
    topRatedMovies=ApiServices().getTopRatedMovies();
    upcomingMovies=ApiServices().getUpcomingMovies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("NETFLIX",
        style: TextStyle(
          color: Colors.red,
          fontSize: 30,fontWeight: FontWeight.bold
          )), // Add a title to the app bar
      ),
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Trending Movies", style: TextStyle(fontSize: 17)),
              SizedBox(height: 15),
              // TrendingSlider(),

                SizedBox(
                  child: FutureBuilder(
                    future: trendingMovies,
                   builder: (context, snapshot) {
                    if(snapshot.hasError){
                       return Center(
                      child: Text(snapshot.error.toString()),
                     );
                    }else if(snapshot.hasData){
                      // final data = snapshot.data;
                      return TrendingSlider(snapshot: snapshot,);

                    }else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                   },
                   
                   ),
                ),


              SizedBox(height: 15),
              Text("Top Rated Movies", style: TextStyle(fontSize: 17)),
              // MovieSlider(),

              
                SizedBox(
                  child: FutureBuilder(
                    future:topRatedMovies ,
                   builder: (context, snapshot) {
                    if(snapshot.hasError){
                       return Center(
                      child: Text(snapshot.error.toString()),
                     );
                    }else if(snapshot.hasData){
                      // final data = snapshot.data;
                      return MovieSlider(snapshot: snapshot);

                    }else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                   },
                   
                   ),
                ),

              Text("Upcoming Movies", style: TextStyle(fontSize: 17)),
              SizedBox(
                height: 15,
              ),
              // MovieSlider(),

                SizedBox(
                  child: FutureBuilder(
                    future:upcomingMovies ,
                   builder: (context, snapshot) {
                    if(snapshot.hasError){
                       return Center(
                      child: Text(snapshot.error.toString()),
                     );
                    }else if(snapshot.hasData){
                      // final data = snapshot.data;
                      return MovieSlider(snapshot: snapshot);

                    }else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                   },
                   
                   ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
