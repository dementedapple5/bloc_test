import 'package:bloc_test/src/models/movie.dart';
import 'package:bloc_test/src/resources/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc{
  final _repository = MovieRepository();
  List<Movie> movies = List();
  final _moviesFetcher = PublishSubject<List<Movie>>();

  Observable<List<Movie>> get allMovies => _moviesFetcher.stream;

  fetchGenreMovies(String genre, int page) async {
    List<Movie> movieContainer = await _repository.fetchGenreMovies(true, genre, page);
    movies.addAll(movieContainer);
    _moviesFetcher.sink.add(movies);
  }

  fetchPopMovies(int page) async {
    List<Movie>  movieContainer = await _repository.fetchPopMovies(page);
    movies.addAll(movieContainer);
    _moviesFetcher.sink.add(movies);
  }

  dispose(){
    _moviesFetcher.close();
  }

}

final bloc = MoviesBloc();
