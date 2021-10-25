import 'package:flutter/material.dart';
import 'package:practica/src/database/database_helper_favoritos.dart';
import 'package:practica/src/models/actor_model.dart';
import 'package:practica/src/models/peliculas_model.dart';
import 'package:practica/src/network/api_actores.dart';

// class DetailScreen extends StatelessWidget
// {
//   const DetailScreen({Key? key}) : super(key: key);


class DetailScreen extends StatefulWidget
{
  DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
{

  @override
  void initState()
  {
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    DatabaseHelperFavoritos _databaseHelper = DatabaseHelperFavoritos();
    ApiActores? apiActores = ApiActores();
    final movie = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Pelicula'),
        actions: [
          IconButton(
            onPressed: ()
            {
              print("caca " + movie['backdropPath'].toString());

              PeliculasModel mubi = PeliculasModel(
                backdropPath: movie['backdropPath'],
                id: movie['id'],
                originalLanguage: movie['originalLanguage'],
                originalTitle: movie['originalTitle'],
                overview: movie['overview'],
                popularity: movie['popularity'],
                posterPath: movie['posterPath'],
                releaseDate: movie['releaseDate'],
                title: movie['title'],
                voteAverage: movie['voteAverage'],
                voteCount: movie['voteCount'],
              );

              _databaseHelper.insert(mubi.toMap()).then(
                (value)
                {
                  if(value > 0)
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registro insertado correctamente'))
                    );
                  }
                  else
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('La solicitud no se completo'))
                    );
                  }
                }
              );
            },
            icon: Icon(Icons.favorite)
          )
        ],
      ),
      body: Container(
        color: Color(0xffFFFFFF),
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 60.0, left: 60.0),
                child: Image(image: NetworkImage('https://image.tmdb.org/t/p/w500/${movie['posterPath']}'))
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 120,
                  child: SingleChildScrollView(
                    child: Flexible(child: Text(movie['overview'], style: TextStyle(color: Colors.black, fontSize: 16.0))),
                  )
                )
                // Flexible(child: Text(movie['overview'], style: TextStyle(color: Colors.black, fontSize: 16.0))),
              ),
              RaisedButton(
                child: Text('Actores'),
                onPressed: ()
                {
                  Navigator.pushNamed(
                    context,
                    '/actores',
                    arguments:
                    {
                      'id': movie['id'],
                    }
                  );
                },
              ),
              RaisedButton(
                child: Text('Trailer'),
                onPressed: ()
                {
                  Navigator.pushNamed(
                    context,
                    '/trailer',
                    arguments:
                    {
                      'id': movie['id'],
                    }
                  );
                },
              )
            ],
          )
        ),
      ),
    );
  }
}