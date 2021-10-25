import 'package:flutter/material.dart';
import 'package:practica/src/models/peliculas_model.dart';
import 'package:practica/src/models/popular_movies_model.dart';

class CardFavoritoView extends StatelessWidget
{
  const CardFavoritoView(
    {Key? key,
    required this.popular
  }) : super(key: key);

  final PeliculasModel popular;

  @override
  Widget build(BuildContext context)
  {
    print("AAAAAA" + popular.backdropPath.toString());

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
                          '/detailfav',
                          arguments:
                          {
                            'title': popular.title,
                            'overview': popular.overview,
                            'posterPath': popular.posterPath,    
                            'id': popular.id,    
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