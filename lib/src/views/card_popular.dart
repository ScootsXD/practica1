import 'package:flutter/material.dart';
import 'package:practica/src/models/peliculas_model.dart';
import 'package:practica/src/models/popular_movies_model.dart';

class CardPopularView extends StatelessWidget
{
  const CardPopularView(
    {Key? key,
    required this.popular
  }) : super(key: key);

  final PopularMoviesModel popular;

  @override
  Widget build(BuildContext context)
  {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            offset: Offset(0.0, 5.0),
            blurRadius: 2.5
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [    
            Container(
              child: FadeInImage(
                placeholder: AssetImage('assets/activity_indicator.gif'),
                image: NetworkImage('https://image.tmdb.org/t/p/w500${popular.backdropPath}'),
                fadeInDuration: Duration(milliseconds: 200),
              )
            ),
            Opacity(
              opacity: .5,
              child: Container(
                padding: EdgeInsets.only(left: 10.0),
                height: 60.0,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(popular.title!, style: TextStyle(color: Colors.white, fontSize: 12.0),),
                    MaterialButton(
                      onPressed: ()
                      {
                        Navigator.pushNamed(
                          context,
                          '/detail',
                          arguments:
                          {
                            'backdropPath': popular.backdropPath,
                            'id': popular.id,
                            'originalLanguage': popular.originalLanguage,
                            'originalTitle': popular.originalTitle,
                            'overview': popular.overview,
                            'popularity': popular.popularity,
                            'posterPath': popular.posterPath,
                            'releaseDate': popular.releaseDate,
                            'title': popular.title,
                            'voteAverage': popular.voteAverage,
                            'voteCount': popular.voteCount,

                          }
                        );
                      },
                      child: Icon(Icons.chevron_right, color: Colors.white,),
                    )
                  ],
                ),
              )
            )
          ]
        ),
      )
    );
  }
}