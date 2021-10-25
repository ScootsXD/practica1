import 'package:flutter/material.dart';
import 'package:practica/src/utils/color_settings.dart';

class DashBoardScreen extends StatelessWidget
{
  const DashBoardScreen({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('DASHBOARD'),
        backgroundColor: ColorSettings.colorPrimary,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              onDetailsPressed: ()
              {
                Navigator.pushNamed(context, '/perfil');
              },
              accountName: Text('Luciano Lozano Duran'),
              accountEmail: Text('17031278@itcelaya.edu.mx'),
              currentAccountPicture: CircleAvatar(
                child: Image.network('https://electronicssoftware.net/wp-content/uploads/user.png')
              ),
              decoration: BoxDecoration(
                color: ColorSettings.colorPrimary
              ),
            ),
            ListTile(
              title: Text('Practica 1'),
              subtitle: Text('Generador de cambio'),
              leading: Icon(Icons.monetization_on_outlined),
              trailing: Icon(Icons.chevron_right_sharp),
              onTap: ()
              {
                Navigator.pushNamed(context, '/opc1');
              },
            ),
            ListTile(
              title: Text('Intenciones'),
              subtitle: Text('Intenciones implicitas'),
              leading: Icon(Icons.phone_android),
              trailing: Icon(Icons.chevron_right),
              onTap: ()
              {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/intenciones');
              },
            ),
            ListTile(
              title: Text('Notas'),
              subtitle: Text('CRUD Notas'),
              leading: Icon(Icons.note),
              trailing: Icon(Icons.chevron_right),
              onTap: ()
              {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/notas');
              },
            ),
            ListTile(
              title: Text('Movies'),
              subtitle: Text('Prueba API REST'),
              leading: Icon(Icons.movie),
              trailing: Icon(Icons.chevron_right),
              onTap: ()
              {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/movie');
              },
            )
          ],
        )
      ),
    );
  }
}