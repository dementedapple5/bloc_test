import 'package:bloc_test/src/blocs/movies_bloc.dart';
import 'package:bloc_test/src/models/movies_container.dart';
import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class MovieApiProvider{
  Client client = Client();
  final _apiKey = '36778990a716e8ef5494fc710317e722';


  Future<MoviesContainer> fetchPopMoviesAPI() async{
    final response = await client.get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&page=$currentPage");

    if (response.statusCode == 200) {
      return MoviesContainer.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception('Failed to load movies');
    }
  }

  Future<MoviesContainer> fetchMoviesByGenreAPI(bool adult, String genre) async{
    final response = await client.get("https://api.themoviedb.org/3/discover/movie?api_key=3$_apiKey&sort_by=popularity.desc&include_adult=${adult.toString()}&include_video=false&page=1&with_genres=$genre");

    if (response.statusCode == 200) {
      return MoviesContainer.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception('Failed to load movies');
    }
  }


}