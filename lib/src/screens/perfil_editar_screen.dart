import 'package:flutter/material.dart';
import 'package:practica/src/database/database_helper_perfil.dart';
import 'package:practica/src/models/perfil_model.dart';
import 'package:practica/src/utils/color_settings.dart';

class PerfilEditarScreen extends StatefulWidget
{
  PerfilModel? perfil;
  PerfilEditarScreen({Key? key}) : super(key: key);

  @override
  _PerfilEditarScreenState createState() => _PerfilEditarScreenState();
}

class _PerfilEditarScreenState extends State<PerfilEditarScreen>
{
  late DatabaseHelperPerfil _databaseHelper;

  TextEditingController _controllerNombre = TextEditingController();
  TextEditingController _controllerApellidoPaterno = TextEditingController();
  TextEditingController _controllerApellidoMaterno = TextEditingController();
  TextEditingController _controllerNumero = TextEditingController();
  TextEditingController _controllerCorreo = TextEditingController();

  @override
  void initState()
  {
    _databaseHelper = DatabaseHelperPerfil();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorSettings.colorPrimary,
        title: Text('Editar Perfil'),
      ),
      body: ListView(
        children: [
          _crearTextFieldNombre(),
          SizedBox(height: 10),
          _crearTextFieldApellidoPaterno(),
          SizedBox(height: 10),
          _crearTextFieldApellidoMaterno(),
          SizedBox(height: 10),
          _crearTextFieldNumero(),
          SizedBox(height: 10),
          _crearTextFieldCorreo(),
          ElevatedButton(
            onPressed: ()
            {
              PerfilModel perfil = PerfilModel(
                id: 1,
                nombre: _controllerNombre.text,
                apellido_paterno: _controllerApellidoPaterno.text,
                apellido_materno: _controllerApellidoMaterno.text,
                numero: _controllerNumero.text,
                correo: _controllerCorreo.text,
              );

              _databaseHelper.update(perfil.toMap()).then(
                (value)
                {
                  if(value > 0)
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registro insertado correctamente'))
                    );
                  }
                  else
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('La solicitud no se completo'))
                    );
                  }
                }
              );
            },
            child: Text('Guardar'),
          )
        ],
      ),
    );
  }

  Widget _crearTextFieldNombre()
  {
    return TextField(
      controller: _controllerNombre,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        labelText: "Nombre",
        errorText: "Este campo es obligatorio"
      ),
    );
  }

  Widget _crearTextFieldApellidoPaterno()
  {
    return TextField(
      controller: _controllerApellidoPaterno,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        labelText: "Apellido Paterno",
        errorText: "Este campo es obligatorio"
      ),
    );
  }

  Widget _crearTextFieldApellidoMaterno()
  {
    return TextField(
      controller: _controllerApellidoMaterno,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        labelText: "Apellido Materno",
        errorText: "Este campo es obligatorio"
      ),
    );
  }

  Widget _crearTextFieldNumero()
  {
    return TextField(
      controller: _controllerNumero,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        labelText: "Numero de telefono",
        errorText: "Este campo es obligatorio"
      ),
    );
  }

  Widget _crearTextFieldCorreo()
  {
    return TextField(
      controller: _controllerCorreo,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        labelText: "Correo electronico",
        errorText: "Este campo es obligatorio"
      ),
    );
  }
}