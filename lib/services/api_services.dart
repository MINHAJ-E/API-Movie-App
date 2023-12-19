import 'dart:convert';

import 'package:movie_app/constants/constance.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/model/model.dart';

class ApiServices{
  static const _trendingUrl="https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}";
  static const _topRatedUrl="https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}";
  static const _upComingUrl="https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}";
  // final searchUrl ="https://api.themoviedb.org/3/search/movie?query=$query&api_key=${Constants.apiKey}";

  Future<List<Movie>>getTrendingMovies()async{
    final response= await http.get(Uri.parse(_trendingUrl));
    if(response.statusCode==200){
      final deCodeData = json.decode(response.body)['results'] as List;
      return deCodeData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception("something is misssinfg");
    }

  }
  Future<List<Movie>>getTopRatedMovies()async{
    final response= await http.get(Uri.parse(_topRatedUrl));
    if(response.statusCode==200){
      final deCodeData = json.decode(response.body)['results'] as List;
      return deCodeData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception("something is misssinfg");
    }

  }
  Future<List<Movie>>getUpcomingMovies()async{
    final response= await http.get(Uri.parse(_upComingUrl));
    if(response.statusCode==200){
      final deCodeData = json.decode(response.body)['results'] as List;
      return deCodeData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception("something is misssinfg");
    }

  }
//  Future<List<Movie>> searchMovie({required searchurl}) async {
//     final response= await http.get(Uri.parse(searchurl));
//     if(response.statusCode==200){
//       final deCodeData = json.decode(response.body)['results'] as List;
//       return deCodeData.map((movie) => Movie.fromJson(movie)).toList();
//     }else{
//       throw Exception("something is misssinfg");
//     }

//   }
}