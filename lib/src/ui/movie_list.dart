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


  final ScrollController _controller = ScrollController();

  final genres = ["28", "14", "12"];

  final Map<String, int> genrePageMap = {"28" : 1, "14" : 1, "12" : 1};

  @override
  void initState() {
    super.initState();

    for (String genre in genrePageMap.keys) {
      bloc.fetchGenreMovies(genre, genrePageMap[genre]);
    }

  }
  @override
  void dispose() {
    bloc.dispose();
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
              return ListView.builder(
                itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return _MovieShelf(snapshot.data[index], _controller);
                  }
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

  final MoviesContainer mc;
  final ScrollController controller;

  _MovieShelf(this.mc, this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250.0,
      alignment: Alignment.center,
      child: ListView.builder(
        controller: controller,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: mc.movies.length,
          itemBuilder: (context, index){
            return _MovieItem(mc.movies[index]);
          }
      ),
    );
  }
}


class _MovieItem extends StatelessWidget {

  final Movie _movie;

  _MovieItem(this._movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network('https://image.tmdb.org/t/p/w185${_movie.posterPath}', height: 180.0),
            Text(_movie.title, style: Theme.of(context).textTheme.display2, maxLines: 2, softWrap: true)
          ],
      )
    );
  }
}
