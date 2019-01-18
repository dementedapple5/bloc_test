import 'package:bloc_test/src/blocs/movies_bloc.dart';
import 'package:bloc_test/src/models/movie.dart';
import 'package:flutter/material.dart';

class MovieList extends StatefulWidget {
  @override
  MovieListState createState() {
    return new MovieListState();
  }
}

class MovieListState extends State<MovieList> {



  final PageController _pageController = PageController();
  int currentPage = 1;
  Movie selectedMovie;


  @override
  void initState() {
    super.initState();
    bloc.fetchPopMovies(currentPage);
    _pageController.addListener(_checkEndOfShelf);

  }
  @override
  void dispose() {
    bloc.dispose();
    _pageController.removeListener(_checkEndOfShelf);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Movie List"), elevation: 0.0),
      body: StreamBuilder(
          stream: bloc.allMovies,
          builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildMovieShelfPager(snapshot.data),
                  selectedMovie == null ? Container() : _buildMovieInfo(selectedMovie)
                ],
              );
            }
            else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          }),
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }


  Widget _buildMovieShelfPager(List<Movie> movies) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 400.0,
        width: double.infinity,
        alignment: Alignment.center,
        child: PageView.builder(
          onPageChanged: (page) {
            selectedMovie = movies[page];
          },
            itemBuilder: (context, index) {
              return _MovieItem(movies[index]);
            })
      ),
    );
  }


  Widget _buildMovieInfo(Movie movie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(movie.title, style: Theme.of(context).textTheme.display1),
        Padding(padding: const EdgeInsets.symmetric(vertical: 10.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _movieInfoItem(movie.voteCount, "Vote Count"),
            _movieInfoItem(movie.voteAverage, "Vote Avgerage"),
            _movieInfoItem(movie.popularity, "Popularity")
          ],
        )
      ],
    );
  }

  Widget _movieInfoItem(dynamic num, String desc){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(num.toString(), style: Theme.of(context).textTheme.display3),
        Text(desc, style: Theme.of(context).textTheme.display2)
      ],
    );
  }


  void _checkEndOfShelf() {
    if (_pageController.position.pixels == _pageController.position.maxScrollExtent) {
      currentPage++;
      bloc.fetchPopMovies(currentPage);
    }
  }


  Widget _buildBottomAppBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Search')),
        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile')),
      ],
    );
  }
}


class _MovieItem extends StatelessWidget {

  final Movie _movie;

  _MovieItem(this._movie);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      color: Colors.grey,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: 150.0,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage('https://image.tmdb.org/t/p/w185${_movie.posterPath}'), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
