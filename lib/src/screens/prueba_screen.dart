import 'package:flutter/material.dart';
import 'package:practica/src/database/database_helper_perfil.dart';
import 'package:practica/src/models/perfil_model.dart';
import 'package:practica/src/utils/color_settings.dart';

class PruebaScreen extends StatefulWidget
{
  PerfilModel? perfil;
  PruebaScreen({Key? key, this.perfil}) : super(key: key);

  @override
  _PruebaScreenState createState() => _PruebaScreenState();
}

class _PruebaScreenState extends State<PruebaScreen>
{
  late DatabaseHelperPerfil _databaseHelper;

  TextEditingController _controllerNombre = TextEditingController();
  TextEditingController _controllerApellidoPaterno = TextEditingController();

  @override
  void initState()
  {
    if(widget.perfil != null)
    {
      _controllerNombre.text = widget.perfil!.nombre!;
      _controllerApellidoPaterno.text = widget.perfil!.apellido_paterno!;
    }

    _databaseHelper = DatabaseHelperPerfil();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorSettings.colorPrimary,
        title: widget.perfil != null ? Text('Agregar Nota') : Text('Editar Perfil'),
      ),
      body: ListView(
        children: [
          _crearTextFieldTitulo(),
          SizedBox(height: 10),
          _crearTextFieldDetalle(),
          ElevatedButton(
            onPressed: ()
            {
              PerfilModel nota = PerfilModel(
                nombre: _controllerNombre.text,
                apellido_paterno: _controllerApellidoPaterno.text
              );

              _databaseHelper.insert(nota.toMap()).then(
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
            child: Text('Guardar Nota'),
          )
        ],
      ),
    );
  }

  Widget _crearTextFieldTitulo()
  {
    return TextField(
      controller: _controllerNombre,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        labelText: "Titulo de la nota",
        errorText: "Este campo es obligatorio"
      ),
      onChanged: (value)
      {

      },
    );
  }

  Widget _crearTextFieldDetalle()
  {
    return TextField(
      controller: _controllerApellidoPaterno,
      maxLines: 8,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        labelText: "Detalle de la nota",
        errorText: "Este campo es obligatorio"
      ),
      onChanged: (value)
      {
        
      },
    );
  }
}