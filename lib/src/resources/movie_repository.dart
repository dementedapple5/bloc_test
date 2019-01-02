import 'package:bloc_test/src/models/movies_container.dart';
import 'package:bloc_test/src/resources/movie_api_provider.dart';

class MovieRepository{
  final movieApiProvider = MovieApiProvider();

  Future<MoviesContainer> fetchPopMovies() => movieApiProvider.fetchPopMoviesAPI();

  Future<MoviesContainer> fetchGenreMovies(bool adult, String genre) => movieApiProvider.fetchMoviesByGenreAPI(adult, genre);

}