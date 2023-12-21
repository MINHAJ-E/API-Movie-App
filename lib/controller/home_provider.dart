import 'package:flutter/material.dart';
import 'package:movie_app/constants/constance.dart';
import 'package:movie_app/model/model.dart';
import 'package:movie_app/services/api_services.dart';

class HomeProvider extends ChangeNotifier{
   final ApiServices movieApiService = ApiServices();
    List<Movie> movies = [];
      Future getHomeDAta({required url}) async {
    try {
      List<Movie> movieResults = await movieApiService.getMovies(apiUrl: url);
      movies = movieResults;
      notifyListeners();
      return movies;
    } catch (error) {
      print('Error fetching movies: $error');
      notifyListeners();
    }
    notifyListeners();
  }
}