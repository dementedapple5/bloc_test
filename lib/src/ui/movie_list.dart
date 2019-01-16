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



  final ScrollController _scrollController = ScrollController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    bloc.fetchPopMovies(currentPage);
    _scrollController.addListener(_checkEndOfShelf);

  }
  @override
  void dispose() {
    bloc.dispose();
    _scrollController.removeListener(_checkEndOfShelf);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Movie List")),
      body: StreamBuilder(
          stream: bloc.allMovies,
          builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
            if (snapshot.hasData) {
              return _buildMovieShelf(snapshot.data);
            }
            else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          }),
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }


  Widget _buildMovieShelf(List<Movie> movies) {
    return Container(
      width: double.infinity,
      height: 250.0,
      alignment: Alignment.center,
      child: ListView.builder(
          controller: _scrollController,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index){
            return _MovieItem(movies[index]);
          }
      ),
    );
  }

  Widget _buildMovieInfo(Movie movie) {

  }


  void _checkEndOfShelf() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0)
      ),
      width: 250.0,
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: Image.network('https://image.tmdb.org/t/p/w185${_movie.posterPath}', height: 280.0)
    );
  }
}
