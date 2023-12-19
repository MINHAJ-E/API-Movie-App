// import 'package:flutter/material.dart';
// import 'package:movie_app/constants/constance.dart';
// import 'package:movie_app/model/model.dart';
// import 'package:movie_app/services/api_services.dart';

// class SearchProvider extends ChangeNotifier{
//     TextEditingController searchController = TextEditingController();
//   List<Movie> searchedResult = [];
//   final ApiServices apiServices =ApiServices();

//    void searchMovies(String query) async {
//     // String query = queryController.text.trim();
//     if (query.isNotEmpty) {
//       try {
//         final searchUrl =
//             "https://api.themoviedb.org/3/search/movie?query=$query&api_key=${Constants.apiKey}";
//         List<Movie> movies =
//             await apiServices.searchMovie(searchurl: searchUrl);

//         searchedResult = movies;
//         notifyListeners();
//       } catch (e) {
//         print("Error: $e");
//       }
//     } else {
//       searchedResult = [];
//       notifyListeners();
//     }
//   }
// }

