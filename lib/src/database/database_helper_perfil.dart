import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:practica/src/models/perfil_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelperPerfil
{
  static final _nombreBD = "PERFILBD";
  static final _versionBD = 1;
  static final _nombreTBL = "tblPerfil";
  

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
    await db.execute("create table $_nombreTBL (id integer primary key, avatar varchar(100), nombre varchar(20), apellido_paterno varchar(20), apellido_materno varchar(20), numero varchar(15), correo varchar(30))");
  }

  Future<int> insert(Map<String, dynamic> row) async
  {
    var conexion = await database;

    return conexion!.insert(_nombreTBL, row);
  }

  Future<int> update(Map<String, dynamic> row) async
  {
    var conexion = await database;
    return conexion!.update(_nombreTBL, row, where: 'id = 1');
  }

  Future<int> delete(int id) async
  {
    var conexion = await database;
    return await conexion!.delete(_nombreTBL, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<PerfilModel>> getPerfil() async
  {
    var conexion = await database;
    var resultado = await conexion!.query(_nombreTBL);

    return resultado.map((notaMap) => PerfilModel.fromMap(notaMap)).toList();
  }

  Future<PerfilModel> getNote(int id) async
  {
    var conexion = await database;
    var resultado = await conexion!.query(_nombreTBL, where: 'id = ?', whereArgs: [id]);

    return PerfilModel.fromMap(resultado.first);
  }
}