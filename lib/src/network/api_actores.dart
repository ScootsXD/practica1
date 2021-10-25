import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practica/src/models/actor_model.dart';

class ApiActores
{
  Future<List<ActorModel>?> getAllActores(int id) async
  {
    var URL = Uri.parse('https://api.themoviedb.org/3/movie/${id}/credits?api_key=c45a8862fc68bfc0f863e49c14723c21&language=es-MX');

    final response = await http.get(URL);

    if(response.statusCode == 200)
    {
      var actores = jsonDecode(response.body)['cast'] as List;
      List<ActorModel> listActores = actores.map((actor) => ActorModel.fromMap(actor)).toList();

      return listActores;
    }
    else
    {
      return null;
    }
  }
}