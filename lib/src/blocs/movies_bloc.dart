import 'package:bloc_test/src/models/movies_container.dart';
import 'package:bloc_test/src/resources/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc{
  final _repository = MovieRepository();
  final List<MoviesContainer> moviesContainer = new List();
  final _moviesFetcher = PublishSubject<List<MoviesContainer>>();

  Observable<List<MoviesContainer>> get allMovies => _moviesFetcher.stream;

  fetchGenreMovies(String genre, int page) async {
    MoviesContainer movieContainer = await _repository.fetchGenreMovies(true, genre, page);
    moviesContainer.add(movieContainer);
    _moviesFetcher.sink.add(moviesContainer);
  }

  dispose(){
    _moviesFetcher.close();
  }

}

final bloc = MoviesBloc();

int currentPage = 1;