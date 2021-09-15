import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Opcion1Screen extends StatelessWidget
{
  Opcion1Screen({Key? key}) : super(key: key);
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generador de propina'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ],
                controller: textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Consumo',
                ),
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.red,
                child: Text('Calcular'),
                onPressed: ()
                {
                  int val = int.tryParse(textController.text) ?? 42069;

                  if(val != 42069)
                  {
                    showDialog(
                      context: context,
                      builder: (buildcontext) {
                        return AlertDialog(
                          title: Text("Propina"),
                          content: Text("Total con propina del 10%: " + (val * 1.1).toString()),
                          actions: <Widget>[
                            RaisedButton(
                              child: Text("Cerrar", style: TextStyle(color: Colors.white),),
                              onPressed: (){ Navigator.of(context).pop(); },
                            )
                          ],
                        );
                      }
                    );
                  }
                  else
                  {
                    showDialog(
                      context: context,
                      builder: (buildcontext) {
                        return AlertDialog(
                          title: Text("Propina"),
                          content: Text("Error"),
                          actions: <Widget>[
                            RaisedButton(
                              child: Text("Cerrar", style: TextStyle(color: Colors.white),),
                              onPressed: (){ Navigator.of(context).pop(); },
                            )
                          ],
                        );
                      }
                    );
                  }
                },
              )
            ),
          ],
        )
      )
    );
  }
}
