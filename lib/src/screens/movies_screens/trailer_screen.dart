import 'package:flutter/material.dart';
import 'package:practica/src/models/actor_model.dart';
import 'package:practica/src/models/popular_movies_model.dart';
import 'package:practica/src/models/trailer_model.dart';
import 'package:practica/src/network/api_actores.dart';
import 'package:practica/src/network/api_trailer.dart';
import 'package:practica/src/views/card_popular.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class TrailerScreen extends StatefulWidget
{
  TrailerScreen({Key? key}) : super(key: key);

  @override
  _TrailerScreenState createState() => _TrailerScreenState();
}

class _TrailerScreenState extends State<TrailerScreen>
{
  ApiTrailer? apiTrailer;

  @override
  void initState()
  {
    super.initState();
    apiTrailer = ApiTrailer();
  }

  @override
  Widget build(BuildContext context)
  {
    final movie = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      body: FutureBuilder(
        future: apiTrailer!.getAllTrailers(movie['id']),
        builder: (BuildContext context, AsyncSnapshot<List<TrailerModel>?> snapshot)
        {
          if(snapshot.hasError)
          {
            return Center(child: Text("Error"));
          }
          else
          {
            if(snapshot.connectionState == ConnectionState.done)
            {
              return _listTrailers(snapshot.data, movie['id']);
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

  Widget _listTrailers(List<TrailerModel>? trailers, int id)
  {
    return ListView.separated(
      itemBuilder: (context, index)
      {
        TrailerModel trailerr = trailers![index];
        
        print("nombre " + trailerr.name.toString());
        print("key " + trailerr.key.toString());

        YoutubePlayerController _controller = YoutubePlayerController(
              initialVideoId: trailerr.key.toString(),
              params: YoutubePlayerParams(
                  showControls: true,
                  showFullscreenButton: true,
              ),
            );
        if(trailerr.official == true && trailerr.name == "Official Trailer")
        {
          print("AAAAAAAAAAAAAAAAAAA" + trailerr.key.toString());

          return YoutubePlayerIFrame(
            controller: _controller,
            aspectRatio: 16 / 9,
          );
        }
        else
        {
          return Container();
        }
      },
      separatorBuilder: (_, __) => Divider(height: 10),
      itemCount: trailers!.length,
    );
  }
}