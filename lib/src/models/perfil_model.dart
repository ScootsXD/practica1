class PerfilModel
{
  int? id;
  String? avatar;
  String? nombre;
  String? apellido_paterno;
  String? apellido_materno;
  String? numero;
  String? correo;

  PerfilModel({this.id, this.avatar, this.nombre, this.apellido_paterno, this.apellido_materno, this.numero, this.correo});
  
  // Map -> Object
  factory PerfilModel.fromMap(Map<String, dynamic> map)
  {
    return PerfilModel(
      id: map['id'],
      avatar: map['avatar'],
      nombre: map['nombre'],
      apellido_paterno: map['apellido_paterno'],
      apellido_materno: map['apellido_materno'],
      numero: map['numero'],
      correo: map['correo'],
    );
  }

  // Object -> Map
  Map<String, dynamic> toMap()
  {
    return {
      'id': id,
      'avatar': avatar,
      'nombre': nombre,
      'apellido_paterno': apellido_paterno,
      'apellido_materno': apellido_materno,
      'numero': numero,
      'correo': correo 
    };
  }
}