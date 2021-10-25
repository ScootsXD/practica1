import 'package:flutter/material.dart';
import 'package:practica/src/models/actor_model.dart';
import 'package:practica/src/models/popular_movies_model.dart';
import 'package:practica/src/network/api_actores.dart';
import 'package:practica/src/views/card_popular.dart';

class ActoresScreen extends StatefulWidget
{
  ActoresScreen({Key? key}) : super(key: key);

  @override
  _ActoresScreenState createState() => _ActoresScreenState();
}

class _ActoresScreenState extends State<ActoresScreen>
{
  ApiActores? apiActores;

  @override
  void initState()
  {
    super.initState();
    apiActores = ApiActores();
  }

  @override
  Widget build(BuildContext context)
  {
    final actor = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      body: FutureBuilder(
        future: apiActores!.getAllActores(actor['id']),
        builder: (BuildContext context, AsyncSnapshot<List<ActorModel>?> snapshot)
        {
          if(snapshot.hasError)
          {
            return Center(child: Text("Error"));
          }
          else
          {
            if(snapshot.connectionState == ConnectionState.done)
            {
              return _listActores(snapshot.data);
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

  Widget _listActores(List<ActorModel>? actores)
  {
    return ListView.separated(
      itemBuilder: (context, index)
      {
        ActorModel actorr = actores![index];
        String imagen = 'https://image.tmdb.org/t/p/w500/' + actorr.profilePath.toString();

        if(actorr.profilePath == null)
        {
          imagen = "https://st3.depositphotos.com/4111759/13425/v/600/depositphotos_134255634-stock-illustration-avatar-icon-male-profile-gray.jpg";
        }

        if(actorr.knownForDepartment == "Acting")
        {
          return Container(
            // child: Text("XAAAA" + actorr.profilePath.toString())
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(800.0),
                  child: Image(image: NetworkImage(imagen)),
                ),
                Padding(padding: EdgeInsets.only(top: 15)),
                Text(actorr.name.toString(), style: TextStyle(color: Colors.black, fontSize: 16.0)),
                Padding(padding: EdgeInsets.only(top: 25))
              ]
            )
          );
        }
        else
        {
          return Container();
        }
      },
      separatorBuilder: (_, __) => Divider(height: 10,),
      itemCount: actores!.length,
    );
  }
}