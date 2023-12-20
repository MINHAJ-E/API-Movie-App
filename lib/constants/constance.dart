class Constants{
  static const apiKey = 'b3e0d3eff8d8a525377abdb307695baa';
  static const imagePath = 'https://image.tmdb.org/t/p/w500';
  static const trending = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const topRated = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const upComing = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';
  static const popular = 'https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';
  static const tvPopular = 'https://api.themoviedb.org/3/tv/popular?api_key=${Constants.apiKey}';
  static const tvTopRated = 'https://api.themoviedb.org/3/tv/top_rated?api_key=${Constants.apiKey}';
  static const tvOntheAir = 'https://api.themoviedb.org/3/tv/on_the_air?api_key=${Constants.apiKey}';
}