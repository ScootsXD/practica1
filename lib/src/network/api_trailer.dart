import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practica/src/models/trailer_model.dart';

class ApiTrailer
{
  Future<List<TrailerModel>?> getAllTrailers(id) async
  {
    var URL = Uri.parse('https://api.themoviedb.org/3/movie/${id}/videos?api_key=c45a8862fc68bfc0f863e49c14723c21&language=es_MX');

    final response = await http.get(URL);

    if(response.statusCode == 200)
    {
      var trailerz = jsonDecode(response.body)['results'] as List;
      List<TrailerModel> listTrailers = trailerz.map((trailer) => TrailerModel.fromMap(trailer)).toList();

      return listTrailers;
    }
    else
    {
      return null;
    }
  }
}