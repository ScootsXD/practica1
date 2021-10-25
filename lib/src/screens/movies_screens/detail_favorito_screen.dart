import 'package:flutter/material.dart';
import 'package:practica/src/database/database_helper_favoritos.dart';
import 'package:practica/src/models/actor_model.dart';
import 'package:practica/src/models/peliculas_model.dart';
import 'package:practica/src/network/api_actores.dart';

// class DetailScreen extends StatelessWidget
// {
//   const DetailScreen({Key? key}) : super(key: key);


class DetailFavScreen extends StatefulWidget
{
  DetailFavScreen({Key? key}) : super(key: key);

  @override
  _DetailFavScreenState createState() => _DetailFavScreenState();
}

class _DetailFavScreenState extends State<DetailFavScreen>
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
              showDialog(
                context: context,
                builder: (context)
                {
                  return AlertDialog(
                    title: Text('Confirmacion'),
                    content: Text('Estas seguro del borrado?'),
                    actions: [
                      TextButton(
                        onPressed: ()
                        {
                          Navigator.pop(context);
                          _databaseHelper.delete(movie['id']!).then(
                            (noRows)
                            {
                              if(noRows > 0)
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('El registro se ha eliminado'))
                                );
                                setState(()
                                {

                                });
                              }
                            }
                          );
                        },
                        child: Text('Si')
                      ),
                      TextButton(
                        onPressed: ()
                        {
                          Navigator.pop(context);
                        },
                        child: Text('No')
                      ),
                    ]
                  );
                }
              );
            },
            icon: Icon(Icons.delete),
            iconSize: 18,
          ),
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