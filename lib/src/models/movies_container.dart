import 'package:bloc_test/src/models/movie.dart';

class MoviesContainer{
  int _page;
  int _totalPages;
  int _totalResults;
  String genre;
  List<Movie> _movies = [];

  MoviesContainer.fromJson(Map<String, dynamic> parsedJson){
    _page = parsedJson["page"];
    _totalPages = parsedJson["total_pages"];
    _totalResults = parsedJson["total_results"];
    List<Movie> moviesTemp = [];
    for (int i = 0; i < parsedJson["results"].length; i++){
      moviesTemp.add(Movie(parsedJson["results"][i]));
    }
    _movies = moviesTemp;
  }



  List<Movie> get movies => _movies;

  int get totalResults => _totalResults;

  int get totalPages => _totalPages;

  int get page => _page;


}