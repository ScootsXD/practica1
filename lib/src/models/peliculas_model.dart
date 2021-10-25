class PeliculasModel
{
  String? backdropPath;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  double? voteAverage;
  int? voteCount;

  PeliculasModel({this.backdropPath, this.id, this.originalLanguage, this.originalTitle, this.overview, this.popularity, this.posterPath, this.releaseDate, this.title, this.voteAverage, this.voteCount});
  
  // Map -> Object
  factory PeliculasModel.fromMap(Map<String, dynamic> map)
  {
    return PeliculasModel(
      backdropPath: map['backdropPath'],
      id: map['id'],
      originalLanguage: map['originalLanguage'],
      originalTitle: map['originalTitle'],
      overview: map['overview'],
      popularity: map['popularity'],
      posterPath: map['posterPath'],
      releaseDate: map['releaseDate'],
      title: map['title'],
      voteAverage: map['voteAverage'] is int ? (map['voteAverage'] as int).toDouble() : map['voteAverage'],
      voteCount: map['voteCount'],
    );
  }

  // Object -> Map
  Map<String, dynamic> toMap()
  {
    return {
      'backdropPath': backdropPath,
      'id': id,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'releaseDate': releaseDate,
      'title': title,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }
}