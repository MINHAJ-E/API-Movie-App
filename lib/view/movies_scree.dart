import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants/constance.dart';
import 'package:movie_app/model/model.dart';
import 'package:movie_app/services/api_services.dart';
import 'package:movie_app/widgets/contaner.dart';
import 'package:movie_app/widgets/movielist_builder.dart';


class MovieScreen extends StatefulWidget {
  MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
   ApiServices service = ApiServices();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: Text(
            "MOVIES",
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
      body: Stack(
        children: [
          AllContainer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CardHeadings(heading: "Trending", left: 20, top: 20),
            Expanded(
              child: FutureBuilder(
                  future: ApiServices().getMovies(apiUrl: Constants.popular),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error.toString()}");
                    } else if (snapshot.hasData) {
                      return ListItem(snapshot: snapshot);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
                
            ),
            
          ],
        ),
    ]  ),
    );
  }
}