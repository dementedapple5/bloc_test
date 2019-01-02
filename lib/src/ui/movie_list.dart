import 'package:bloc_test/src/blocs/movies_bloc.dart';
import 'package:bloc_test/src/models/movie.dart';
import 'package:bloc_test/src/models/movies_container.dart';
import 'package:flutter/material.dart';

class MovieList extends StatefulWidget {
  @override
  MovieListState createState() {
    return new MovieListState();
  }
}

class MovieListState extends State<MovieList> {

  ScrollController _controller = ScrollController();

  final genres = ["28", "14", "12"];

  @override
  void initState() {
    super.initState();
    //_controller.addListener(refreshMovies);
    bloc.fetchAllMovies(genres);
  }
  @override
  void dispose() {
    bloc.dispose();
    //_controller.removeListener(refreshMovies);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Movie List")),
      body: StreamBuilder(
          stream: bloc.allMovies,
          builder: (context, AsyncSnapshot<List<MoviesContainer>> snapshot) {
            if (snapshot.hasData) {
              List<Movie> movies = List();
              for (MoviesContainer mc in snapshot.data) {
                for (Movie mv in mc.movies){
                  movies.add(mv);
                }
              }
              return ListView.builder(

                controller: _controller,
                itemCount: movies.length,
                itemBuilder: (BuildContext context, int index) {
                  return _MovieItem(movies[index]);
                },
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

/*
  void refreshMovies() {

    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      currentPage++;
      bloc.fetchAllMovies();
    }
  }*/

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


class _MovieShelf extends StatelessWidget {

  MoviesContainer mc;

  _MovieShelf(this.mc);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
        itemCount: mc.movies.length,
        itemBuilder: (context, index){
          return _MovieItem(mc.movies[index]);
        }
    );
  }
}


class _MovieItem extends StatelessWidget {

  final Movie _movie;

  _MovieItem(this._movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
              child: Image.network('https://image.tmdb.org/t/p/w185${_movie.posterPath}')
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_movie.title, style: Theme.of(context).textTheme.display1, maxLines: 2),
                  Text(_movie.overview, style: Theme.of(context).textTheme.display2, maxLines: 4),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
