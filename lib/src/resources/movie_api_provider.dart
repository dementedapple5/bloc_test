import 'package:bloc_test/src/blocs/movies_bloc.dart';
import 'package:bloc_test/src/models/movie.dart';
import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class MovieApiProvider{
  Client client = Client();
  final _apiKey = '36778990a716e8ef5494fc710317e722';


  Future<List<Movie>> fetchPopMoviesAPI(int page) async{
    final response = await client.get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&page=$page");

    if (response.statusCode == 200) {

      Map<String, dynamic> parsedJson = jsonDecode(response.body);
      List<Movie> movies = List();

      for (int i = 0; i < parsedJson["results"].length; i++){
        movies.add(Movie(parsedJson["results"][i]));
      }

      return movies;


    }
    else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> fetchMoviesByGenreAPI(bool adult, String genre, int page) async{
    final response = await client.get("https://api.themoviedb.org/3/discover/movie?api_key=$_apiKey&sort_by=popularity.desc&include_adult=${adult.toString()}&include_video=false&page=$page&with_genres=$genre");

    if (response.statusCode == 200) {
      Map<String, dynamic> parsedJson = jsonDecode(response.body);
      List<Movie> movies = List();

      for (int i = 0; i < parsedJson["results"].length; i++){
        movies.add(Movie(parsedJson["results"][i]));
      }
      return movies;
    }
    else {
      throw Exception('Failed to load movies ${response.statusCode}');
    }
  }


}