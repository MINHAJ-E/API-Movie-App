import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants/constance.dart';
import 'package:movie_app/model/cast_model.dart';
import 'package:movie_app/model/model.dart';

class ApiServices {
  static Dio dio = Dio();

  Future<List<Movie>> getMovies({required apiUrl}) async {
    try {
      final response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonList = response.data;
        List<dynamic> movies = jsonList["results"];
        return movies.map((json) {
          return Movie.fromJson(json);
        }).toList();
      } else {
        throw Exception("Something is missing");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }


  Future<List<Movie>> searchMovie({required searchUrl}) async {
    try {
      final response = await dio.get(searchUrl);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonList = response.data;
        List<dynamic> movies = jsonList["results"];
        return movies.map((json) {
          return Movie.fromJson(json);
        }).toList();
      } else {
        throw Exception("Something is missing");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
 Future<List<CastModel>> getCast({required castUrl}) async {
    try {
      final response = await dio.get(castUrl);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        if (data.containsKey("cast")) {
          final List<dynamic> results = data["cast"];
          return results.map((cast) => CastModel.fromJson(cast)).toList();
        } else {
          throw Exception('No "cast" key in response');
        }
      } else {
        throw Exception('Error function - Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

}
