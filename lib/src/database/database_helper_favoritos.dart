import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:practica/src/models/peliculas_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelperFavoritos
{
  static final _nombreBD = "FAVORITASBD3";
  static final _versionBD = 1;
  static final _nombreTBL = "tblFavoritas";

  static Database? _database;

  Future<Database?> get database async
  {
    if(_database != null)
    {
      return _database;
    }

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async
  {
    Directory carpeta = await getApplicationDocumentsDirectory();
    String rutaBD = join(carpeta.path, _nombreBD);

    return openDatabase(
      rutaBD,
      version: _versionBD,
      onCreate: _crearTabla
    );
  }

  Future<void> _crearTabla(Database db, int version) async
  {
    await db.execute("create table $_nombreTBL (id_pelicula integer primary key, backdropPath varchar(100), id int, originalLanguage varchar(100), originalTitle varchar(100), overview varchar(100), popularity decimal(6, 3), posterPath varchar(100), releaseDate varchar(100), title varchar(100), voteAverage decimal(5, 2), voteCount int)");
  }

  Future<int> insert(Map<String, dynamic> row) async
  {
    var conexion = await database;

    return conexion!.insert(_nombreTBL, row);
  }

  Future<int> update(Map<String, dynamic> row) async
  {
    var conexion = await database;
    return conexion!.update(_nombreTBL, row, where: 'id_pelicula = $row["id_pelicula"]');
  }

  Future<int> delete(int id) async
  {
    var conexion = await database;
    return await conexion!.delete(_nombreTBL, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<PeliculasModel>> getAllPeliculas() async
  {
    var conexion = await database;
    var resultado = await conexion?.rawQuery('select * from tblFavoritas group by id');
    print(resultado);
    return resultado!.map((map) => PeliculasModel.fromMap(map)).toList();
  }
}