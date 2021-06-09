import 'package:flutter/material.dart';
import 'package:practica2_tap/settings/color_settings.dart';

class ConversorScreen extends StatefulWidget {
  const ConversorScreen({ Key? key }) : super(key: key);

  @override
  _ConversorScreenState createState() => _ConversorScreenState();
}

class _ConversorScreenState extends State<ConversorScreen> {
  String centigrados = "°C";
  String farenheit   = "°F";
  double resultado   = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backPrimaryColorApp,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200.0,
                child: Text(
                  "Conversor de Temperatura", 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorApp.backSecondaryColorApp,
                          labelText: "Ingresa el valor a convertir",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18.0,
                            color: Colors.white
                          ),
                        ),
                        onSubmitted: (value){
                          setState(() {
                            if(centigrados == "°C" && _Validation(context, value) == true){
                              resultado = (double.parse(value) * 9/5) + 32;
                              _showResult(context, resultado, 'Resultado.', 'El resultado de la conversion es:', farenheit, Icon(Icons.thermostat, size: 50.0, color: ColorApp.backPrimaryColorApp,));
                              print(resultado);
                            } else if(centigrados == "°F" && _Validation(context, value) == true){
                              resultado = (double.parse(value) - 32) * 5/9;
                              _showResult(context, resultado, 'Resultado.', 'El resultado de la conversion es:', centigrados, Icon(Icons.thermostat, size: 50.0, color: ColorApp.backPrimaryColorApp,));
                            }
                          });
                        },
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            color: ColorApp.backSecondaryColorApp,                          
                            padding: EdgeInsets.all(10.0),
                            child: Text(centigrados, style: TextStyle(color: Colors.white, fontSize: 20.0),),
                            onPressed: (){},
                          ),
                          FloatingActionButton(
                            backgroundColor: ColorApp.backSecondaryColorApp,
                            child: Icon(Icons.swap_horiz),
                            onPressed: (){
                              setState(() {
                                String faren = farenheit;
                                String centi = centigrados;
                                centigrados = faren;
                                farenheit = centi;
                              });
                            }
                          ),
                          RaisedButton(
                            color: ColorApp.backSecondaryColorApp,                          
                            padding: EdgeInsets.all(10.0),
                            child: Text(farenheit, style: TextStyle(color: Colors.white, fontSize: 20.0),),
                            onPressed: (){},
                          ),
                        ],
                      ),
                      SizedBox(height: 50.0,),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: ColorApp.backSecondaryColorApp,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          children: [
                            Text("Resultado", style: TextStyle(color: Colors.white, fontSize: 20.0),),
                            Text(resultado.toString(), style: TextStyle(color: Colors.white, fontSize: 25.0),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showResult(BuildContext context, var resultado, String titulo, String mensaje, String grados, Icon icon){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text(titulo, style: TextStyle(color: Colors.black, fontSize: 35.0),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(mensaje, style: TextStyle(color: Colors.black, fontSize: 20.0),),
              Text(resultado.toString() + ' ' + grados, style: TextStyle(color: Colors.black, fontSize: 25.0),),
              icon,
            ],
          ),
          actions: [
            FlatButton(
              child: Text('Regresar'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  bool _Validation(BuildContext context, String entrada){
    bool validation = true;
    int contPunto = 0;
    int contMenos = 0;
    for(int i = 0; i < entrada.length; i++){
      if(entrada[i] == ' '){
        _showResult(context, entrada, 'Error.','Error en la entrada, no se aceptan espacios vacios', '', Icon(Icons.error, size: 50.0, color: ColorApp.backPrimaryColorApp,));
        validation = false;
        break;
      }else if(entrada[i] == '/'){
        _showResult(context, entrada, 'Error.','Error en la entrada, no se acepta el simbolo "/"', '', Icon(Icons.error, size: 50.0, color: ColorApp.backPrimaryColorApp,));
        validation = false;
        break;
      } else if(entrada.contains(',')){
        _showResult(context, entrada, 'Error.','Error en la entrada, no se acepta el simbolo ","', '', Icon(Icons.error, size: 50.0, color: ColorApp.backPrimaryColorApp,));
        validation = false;
        break;
      } else if(entrada[i] == "-" && i > 0  && entrada[0] != "-"){
        _showResult(context, entrada, 'Error.','Error en la entrada, el simbolo "-" debe ir al inicio', '', Icon(Icons.error, size: 50.0, color: ColorApp.backPrimaryColorApp,));
        validation = false;
        break;
      }else if(entrada[i] == "-"){
        contMenos++;
        if(contMenos > 1){
          _showResult(context, entrada, 'Error.','Error en la entrada, ingrese solo un simbolo "-"', '', Icon(Icons.error, size: 50.0, color: ColorApp.backPrimaryColorApp,));
          validation = false;
        }
      } else if(entrada[i] == "."){
        contPunto++;
        if(contPunto > 1){
          _showResult(context, entrada, 'Error.','Error en la entrada, ingrese solo un simbolo "."', '', Icon(Icons.error, size: 50.0, color: ColorApp.backPrimaryColorApp,));
          validation = false;
        }
      }
    }
    return validation;
  }
}