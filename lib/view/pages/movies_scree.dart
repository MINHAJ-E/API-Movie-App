import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants/constance.dart';
import 'package:movie_app/controller/home_provider.dart';
import 'package:movie_app/widgets/contaner.dart';
import 'package:movie_app/view/pages/widget/movielist_builder.dart';
import 'package:provider/provider.dart';


class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
        final provider = Provider.of<HomeProvider>(context);

    return Scaffold(
      // backgroundColor: Colors.black,
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
          const AllContainer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CardHeadings(heading: "Trending", left: 20, top: 20),
            Expanded(
              child: FutureBuilder(
                  future: provider .getHomeDAta(url: Constants.popular, context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else if (snapshot.hasData) {
                      return ListItem(snapshot: snapshot);
                    } else {
                      return const Center(
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