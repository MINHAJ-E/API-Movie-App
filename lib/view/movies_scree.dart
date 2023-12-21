import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants/constance.dart';
import 'package:movie_app/controller/home_provider.dart';
import 'package:movie_app/model/model.dart';
import 'package:movie_app/services/api_services.dart';
import 'package:movie_app/widgets/contaner.dart';
import 'package:movie_app/widgets/movielist_builder.dart';
import 'package:provider/provider.dart';


class MovieScreen extends StatelessWidget {
  MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
        final provider = Provider.of<HomeProvider>(context);

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
                  future: provider .getHomeDAta(url: Constants.popular),
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