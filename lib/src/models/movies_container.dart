import 'package:bloc_test/src/models/movie.dart';

class MoviesContainer{
  int _page;
  int _total_pages;
  int _total_results;
  List<Movie> _movies = [];

  MoviesContainer.fromJson(Map<String, dynamic> parsedJson){
    _page = parsedJson["page"];
    _total_pages = parsedJson["total_pages"];
    _total_results = parsedJson["total_results"];
    List<Movie> moviesTemp = [];
    for (int i = 0; i < parsedJson["results"].length; i++){
      moviesTemp.add(Movie(parsedJson["results"][i]));
    }
    _movies = moviesTemp;
  }

  List<Movie> get movies => _movies;

  int get total_results => _total_results;

  int get total_pages => _total_pages;

  int get page => _page;


}