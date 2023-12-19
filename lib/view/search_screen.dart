import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/constants/constance.dart';
import 'package:movie_app/controller/search_provider.dart';
import 'package:movie_app/helpers/colors.dart';
import 'package:movie_app/model/model.dart';
import 'package:movie_app/widgets/back_btn.dart';
// import 'package:movie_app/widgets/container.dart'; // Corrected typo here
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
      body: GridView.builder(
        itemCount: searchProvider.searchedResult.length, // Corrected property name here
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 3,
          childAspectRatio: 1 / 1.4,
        ),
        itemBuilder: (context, index) {
          final searchData = searchProvider.searchedResult[index]; // Corrected variable name here
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(1.2),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${Constants.imagePath}${searchData.posterPath ??''}'),
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                  ),
                  color: Color.fromARGB(255, 10, 22, 112),
                  borderRadius: BorderRadius.circular(19),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
