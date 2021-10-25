import 'package:flutter/material.dart';
import 'package:practica/src/database/database_helper_favoritos.dart';
import 'package:practica/src/models/peliculas_model.dart';
import 'package:practica/src/models/popular_movies_model.dart';
import 'package:practica/src/network/api_popular.dart';
import 'package:practica/src/views/card_favorito.dart';
import 'package:practica/src/views/card_popular.dart';

class FavoritosScreen extends StatefulWidget
{
  FavoritosScreen({Key? key}) : super(key: key);

  @override
  _FavoritosScreenState createState() => _FavoritosScreenState();
}

class _FavoritosScreenState extends State<FavoritosScreen>
{
  List<PeliculasModel>? favoritos;

  late DatabaseHelperFavoritos _databaseHelper;
  ApiPopular? apiPopular;

  @override
  void initState()
  {
    super.initState();
    apiPopular = ApiPopular();
    _databaseHelper = DatabaseHelperFavoritos();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Favoritos'),
      ),
      body: FutureBuilder(
        future: _databaseHelper.getAllPeliculas(),
        builder: (BuildContext context, AsyncSnapshot<List<PeliculasModel>?> snapshot)
        {
          if(snapshot.hasError)
          {
            return Center(child: Text("Error"));
          }
          else
          {
            if(snapshot.connectionState == ConnectionState.done)
            {
              return _getFavoritos(snapshot.data);
            }
            else
            {
              return CircularProgressIndicator();
            }
          }
        }
      )
    );
  }

  Widget _getFavoritos(List<PeliculasModel>? favoritos)
  {
    return ListView.separated(
      itemBuilder: (context, index)
      {
        PeliculasModel mubi = favoritos![index];

        return CardFavoritoView(popular: mubi);
      },
      separatorBuilder: (_, __) => Divider(height: 10,),
      itemCount: favoritos!.length,
    );
  }
}