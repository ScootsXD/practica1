// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, duplicate_ignore, avoid_unnecessary_containers, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practica/src/database/database_helper_perfil.dart';
import 'package:practica/src/models/perfil_model.dart';
import 'package:practica/src/utils/color_settings.dart';

class PerfilScreen extends StatefulWidget
{
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<PerfilScreen> with SingleTickerProviderStateMixin
{
  late DatabaseHelperPerfil _databaseHelper;

  _getFromCamera() async
  {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null)
    {
      print("Se tomo la foto");
      imageFile = File(pickedFile.path);
    }
  }

  _getFromGallery() async
  {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null)
    {
      setState(()
      {
        imageFile = File(pickedFile.path);
      });
    }
  }

  File? imageFile;

  final FocusNode myFocusNode = FocusNode();

  List<PerfilModel>? perfil;

  @override
  void initState()
  {
    getData();
    super.initState();
  }

  Future<void> getData() async
  {
    _databaseHelper = DatabaseHelperPerfil();
    perfil = await _databaseHelper.getPerfil();
    print(perfil?[0].numero);
    setState(() {});
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 250.0,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: <Widget>[
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 22.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25.0),
                              child: Text('Perfil',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  fontFamily: 'sans-serif-light',
                                  color: Colors.black
                                )
                              ),
                            )
                          ],
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Stack(
                          fit: StackFit.loose,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                imageFile == null ?
                                (
                                  Container(
                                    width: 140.0,
                                    height: 140.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: new ExactAssetImage('assets/logo_itc.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  )
                                )
                                :
                                (
                                  Container(
                                    child: Image.file(imageFile!),
                                    width: 140.0,
                                    height: 140.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      // image: DecorationImage(
                                      //   image: Image.file(imageFile),
                                      //   fit: BoxFit.cover,
                                      // ),
                                    )
                                  )
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 90.0, right: 100.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 25.0,
                                    child: IconButton(
                                      icon: Icon(Icons.camera_alt),
                                      color: Colors.white,
                                      onPressed: ()
                                      {
                                        print(imageFile);
                                        print("Selecciono tomar foto");
                                        _getFromCamera();
                                      },
                                    ),
                                  )
                                ],
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 90.0, left: 100.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: 25.0,
                                    child: IconButton(
                                      icon: Icon(Icons.photo),
                                      color: Colors.white,
                                      onPressed: ()
                                      {
                                        print(imageFile);
                                        print("Selecciono seleccionar foto");
                                        _getFromGallery();
                                      },
                                    ),
                                  )
                                ],
                              )
                            ),
                          ]
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Color(0xffFFFFFF),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Informacion',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  _getEditIcon(),
                                ],
                              )
                            ],
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    perfil == null ? "Cargando" : "Nombre: " + perfil![0].nombre!,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    perfil == null ? "Cargando" : "Apellido Paterno: " + perfil![0].apellido_paterno!,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    perfil == null ? "Cargando" : "Apellido Materno: " + perfil![0].apellido_materno!,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    perfil == null ? "Cargando" : "Numero de telefono: " + perfil![0].numero!,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    perfil == null ? "Cargando" : "Correo Electronico: " + perfil![0].correo!,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose()
  {
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getEditIcon()
  {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: ()
      {
        Navigator.pushNamed(
          context, '/editar'
        );
      },
    );
  }
}