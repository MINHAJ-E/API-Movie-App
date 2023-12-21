import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/constants/constance.dart';
import 'package:movie_app/controller/search_provider.dart';
import 'package:movie_app/helpers/colors.dart';
import 'package:movie_app/model/model.dart';
import 'package:movie_app/view/detail_screen.dart';
import 'package:movie_app/widgets/back_btn.dart';
import 'package:movie_app/widgets/contaner.dart'; // Corrected typo here
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: "Search...",
                ),
                onChanged: (value) {
                  searchProvider.searchMovies(value);
                },
              ),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Stack(children: [
        AllContainer(),
        GridView.builder(
          itemCount: searchProvider
              .searchedResult.length, // Corrected property name here
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.4,
          ),
          itemBuilder: (context, index) {
            final searchData = searchProvider
                .searchedResult[index]; // Corrected variable name here

            final posterPath = searchData.posterPath;

            if (posterPath != null && Constants.imagePath.isNotEmpty) {
              final imageUrl = '${Constants.imagePath}$posterPath';

              return GestureDetector(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(1.2),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                        ),
                        color: Color.fromARGB(255, 10, 22, 112),
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailesScreen(
                      id: searchData.id!,
                      movie: searchData,
                    ),
                  ));
                },
              );
            } else {
              // Handle the case where posterPath is null or Constants.imagePath is empty
              return Container(
                child: Text("No Data"),
              );
            }
          },
        ),
      ]),
    );
  }
}
