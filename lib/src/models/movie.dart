class Movie{
  int _voteCount;
  int _id;
  bool _video;
  var _voteAverage;
  String _title;
  double _popularity;
  String _posterPath;
  String _originalLanguage;
  String _originalTitle;
  List<int> _genreIds = [];
  String _backdropPath;
  bool _adult;
  String _overview;
  String _releaseDate;


  Movie(mappedMovie){
    _voteCount = mappedMovie["vote_count"];
    _id = mappedMovie["id"];
    _video = mappedMovie["video"];
    _voteAverage = mappedMovie["vote_average"];
    _title = mappedMovie["title"];
    _popularity = mappedMovie["popularity"];
    _posterPath = mappedMovie["poster_path"];
    _originalLanguage = mappedMovie["original_language"];
    _originalTitle = mappedMovie["original_title"];
    _backdropPath = mappedMovie["backdrop_path"];
    _adult = mappedMovie["adult"];
    _overview = mappedMovie["overview"];
    _releaseDate = mappedMovie["release_date"];
    for (int i = 0; i < mappedMovie["genre_ids"].length; i++) {
      _genreIds.add(mappedMovie["genre_ids"][i]);
    }
  }

  String get releaseDate => _releaseDate;

  String get overview => _overview;

  bool get adult => _adult;

  String get backdropPath => _backdropPath;

  List<int> get genreIds => _genreIds;

  String get originalTitle => _originalTitle;

  String get originalLanguage => _originalLanguage;

  String get posterPath => _posterPath;

  double get popularity => _popularity;

  String get title => _title;

  get voteAverage => _voteAverage;

  bool get video => _video;

  int get id => _id;

  int get voteCount => _voteCount;


}