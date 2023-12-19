import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movie_app/constants/constance.dart';
import 'package:movie_app/model/model.dart';

class ApiServices {
  static Dio dio = Dio();

  static const _trendingUrl =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}";
  static const _topRatedUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}";
  static const _upComingUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}";

  Future<List<Movie>> getTrendingMovies() async {
    try {
      final response = await dio.get(_trendingUrl);
      if (response.statusCode == 200) {
        final Map<String,dynamic> jsonList = response.data;
      List<dynamic> movies = jsonList["results"];
     return  movies.map((json) {
        return Movie.fromJson(json);

      }).toList();
      } else {
        throw Exception("Something is missing");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    try {
      final response = await dio.get(_topRatedUrl);
      if (response.statusCode == 200) {
        final Map<String,dynamic> jsonList = response.data;
      List<dynamic> movies = jsonList["results"];
     return  movies.map((json) {
        return Movie.fromJson(json);

      }).toList();
      } else {
        throw Exception("Something is missing");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    try {
      final response = await dio.get(_upComingUrl);
      if (response.statusCode == 200) {
        final Map<String,dynamic> jsonList = response.data;
      List<dynamic> movies = jsonList["results"];
     return  movies.map((json) {
        return Movie.fromJson(json);

      }).toList();
      } else {
        throw Exception("Something is missing");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }

  Future<List<Movie>> searchMovie({required  searchUrl}) async {
    try {
      final response = await dio.get(searchUrl);
      if (response.statusCode == 200) {
        final Map<String,dynamic> jsonList = response.data;
      List<dynamic> movies = jsonList["results"];
     return  movies.map((json) {
        return Movie.fromJson(json);

      }).toList();
      } else {
        throw Exception("Something is missing");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
