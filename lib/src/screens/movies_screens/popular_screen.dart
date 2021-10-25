import 'package:flutter/material.dart';
import 'package:practica/src/models/popular_movies_model.dart';
import 'package:practica/src/network/api_popular.dart';
import 'package:practica/src/views/card_popular.dart';

class PopularScreen extends StatefulWidget
{
  PopularScreen({Key? key}) : super(key: key);

  @override
  _PopularScreenState createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen>
{
  ApiPopular? apiPopular;

  @override
  void initState()
  {
    super.initState();
    apiPopular = ApiPopular();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Peliculas'),
        actions: [
          IconButton(
            onPressed: ()
            {
              Navigator.pushNamed(context, '/favoritos');
            },
            icon: Icon(Icons.favorite)
          )
        ],
      ),
      body: FutureBuilder(
        future: apiPopular!.getAllPopular(),
        builder: (BuildContext context, AsyncSnapshot<List<PopularMoviesModel>?> snapshot)
        {
          if(snapshot.hasError)
          {
            return Center(child: Text("Error"));
          }
          else
          {
            if(snapshot.connectionState == ConnectionState.done)
            {
              return _listPopularMovies(snapshot.data);
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

  Widget _listPopularMovies(List<PopularMoviesModel>? movies)
  {
    return ListView.separated(
      itemBuilder: (context, index)
      {
        PopularMoviesModel popular = movies![index];

        return CardPopularView(popular: popular);
      },
      separatorBuilder: (_, __) => Divider(height: 10,),
      itemCount: movies!.length,
    );
  }
}