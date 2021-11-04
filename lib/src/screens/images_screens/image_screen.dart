import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget
{
  ImageScreen({Key? key}) : super(key: key);

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen>
{
  @override
  void initState()
  {
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    final image = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Detalle de imagen'),
      ),
      body: Container(
        color: Color(0xffFFFFFF),
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 60.0, left: 60.0),
                child: Image(image: NetworkImage('${image['url']}'))
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 20,
                  child: SingleChildScrollView(
                    child: Flexible(child: Text(image['height'].toString() + "x" + image['width'].toString(), style: TextStyle(color: Colors.black, fontSize: 16.0))),
                  )
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 20,
                  child: SingleChildScrollView(
                    child: Flexible(child: Text("Subida el " + image['updatedAt'].toString(), style: TextStyle(color: Colors.black, fontSize: 16.0))),
                  )
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 20,
                  child: SingleChildScrollView(
                    child: Flexible(child: Text("Descargas " + image['downloads'].toString(), style: TextStyle(color: Colors.black, fontSize: 16.0))),
                  )
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 20,
                  child: SingleChildScrollView(
                    child: Flexible(child: Text("Likes " + image['likes'].toString(), style: TextStyle(color: Colors.black, fontSize: 16.0))),
                  )
                )
              ),
            ],
          )
        ),
      ),
    );
  }
}