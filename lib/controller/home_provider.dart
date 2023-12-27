// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:movie_app/model/model.dart';
import 'package:movie_app/services/api_services.dart';

class HomeProvider extends ChangeNotifier{
   final ApiServices movieApiService = ApiServices();
    List<Movie> movies = [];
      Future getHomeDAta({required url,required BuildContext context}) async {
    try {
      List<Movie> movieResults = await movieApiService.getMovies(apiUrl: url, context:context );
      movies = movieResults;
      notifyListeners();
      return movies;
    } catch (error) {
      // print('errorrr fetching movies: $error');
  
      Exception(error);
          notifyListeners();
    }
    notifyListeners();
  }
}