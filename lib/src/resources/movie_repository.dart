import 'package:bloc_test/src/models/movie.dart';
import 'package:bloc_test/src/resources/movie_api_provider.dart';

class MovieRepository{
  final movieApiProvider = MovieApiProvider();

  Future<List<Movie>> fetchPopMovies(int page) => movieApiProvider.fetchPopMoviesAPI(page);

  Future<List<Movie>> fetchGenreMovies(bool adult, String genre, int page) => movieApiProvider.fetchMoviesByGenreAPI(adult, genre, page);

}