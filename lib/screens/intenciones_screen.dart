import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practica2_tap/settings/color_settings.dart';

class IntencionesScreen extends StatelessWidget {
  const IntencionesScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = ImagePicker();
    String pathImage = '';
    return Scaffold(
      backgroundColor: ColorApp.backSecondaryColorApp,
      appBar: AppBar(
        backgroundColor: ColorApp.backPrimaryColorApp,
        title: Text('Intenciones'),
      ),
      body: ListView(
        children: [
          //Lista de funciones que tendra la app
          //-Abrir una pagina web
          //-Llamada telefónica
          //-Enviar Email
          //-Mandar SMS
          //-Tomar Foto
          Card(
            margin: EdgeInsets.all(8.0),
            elevation: 10.0,
            child: ListTile(
              title: Text(
                'Abrir página web', 
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Text('www.itcelaya.edu.mx'),
                  Icon(Icons.touch_app),
                ],
              ),
              leading: Container(
                height: 38.0,
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(Icons.language),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                _OpenURL();
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            elevation: 10.0,
            child: ListTile(
              title: Text(
                'LLamada Telefónica', 
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Text('4611225516'),
                  Icon(Icons.touch_app),
                ],
              ),
              leading: Container(
                height: 38.0,
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(Icons.phone),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: (){_MakeCallPhone();},
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            elevation: 10.0,
            child: ListTile(
              title: Text(
                'Enviar SMS', 
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Text('www.itcelaya.edu.mx'),
                  Icon(Icons.touch_app),
                ],
              ),
              leading: Container(
                height: 38.0,
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(Icons.message),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: (){_SendSMS();},
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            elevation: 10.0,
            child: ListTile(
              title: Text(
                'Enviar Email', 
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Text('19030296@itcelaya.edu.mx'),
                  Icon(Icons.touch_app),
                ],
              ),
              leading: Container(
                height: 38.0,
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(Icons.mail),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: (){_SendEMAIL();},
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            elevation: 10.0,
            child: ListTile(
              title: Text(
                'Tomar Fotografía', 
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Text('Camara'),
                  Icon(Icons.touch_app),
                ],
              ),
              leading: Container(
                height: 38.0,
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(Icons.camera),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: (){_OpenCamera(image, pathImage);},
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _OpenURL() async{
    const url = "https://www.itcelaya.edu.mx";
    if(await canLaunch(url)){
      await launch(url);
    } else{
      throw 'cant launch url';
    }
  }

  Future<void> _MakeCallPhone() async{
    const tel = 'tel:4611225516';
    if(await canLaunch(tel)){
      await launch(tel);
    }
  }

  Future<void> _SendSMS() async{
    const tel = 'sms:4611224416';
    if(await canLaunch(tel)){
      await launch(tel);
    }
  }

  Future<void> _SendEMAIL() async{
    final Uri params = Uri(
      scheme: 'mailto',
      path:   '19030296@itcelaya.edu.mx',
      query:  'subject=Hola Mundo&body=Hola, buen día',
    );
    var email = params.toString();
    if(await canLaunch(email)){
      await launch(email);
    }
  }

  Future<void> _OpenCamera(ImagePicker image, String pathImage) async{
    final foto = image.getImage(source: ImageSource.camera);
  }
}