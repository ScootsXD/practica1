import 'package:flutter/material.dart';
// import 'package:practica/src/models/image_model.dart';
import 'package:practica/src/network/api_image.dart';
import 'package:practica/src/views/card_image.dart';
import 'package:unsplash_client/unsplash_client.dart';

class MainScreen extends StatefulWidget
{
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
{
  ApiImages? apiImages;

  @override
  void initState()
  {
    super.initState();
    apiImages = ApiImages();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Imagenes aleatorias'),
      ),
      body: FutureBuilder(
        future: apiImages!.getRandomImages(),
        builder: (BuildContext context, AsyncSnapshot<List<Photo>?> snapshot)
        {
          if(snapshot.hasError)
          {
            return Center(child: Text("Error"));
          }
          else
          {
            if(snapshot.connectionState == ConnectionState.done)
            {
              return _listRandomImages(snapshot.data);
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

  Widget _listRandomImages(List<Photo>? images)
  {
    return ListView.separated(
      itemBuilder: (context, index)
      {
        Photo image = images![index];

        return CardImageView(image: image);
      },
      separatorBuilder: (_, __) => Divider(height: 10,),
      itemCount: images!.length,
    );
  }
}