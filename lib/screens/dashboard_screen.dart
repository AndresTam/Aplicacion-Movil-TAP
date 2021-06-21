import 'package:practica2_tap/settings/color_settings.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backSecondaryColorApp,
      appBar: AppBar(
        backgroundColor: ColorApp.backPrimaryColorApp,
        title: Text('Topicos Avanzados'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: ColorApp.backPrimaryColorApp
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://www.pinclipart.com/picdir/big/379-3797946_software-developer-computer-servers-web-others-web-developer.png'),
              ),
              accountName: Text(
                'Adnrés Tamayo Martínez',
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text(
                'simonalamona@gmail.com',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              tileColor: ColorApp.backPrimaryColorApp,
              leading: Icon(Icons.thermostat, color: Colors.white,),
              title: Text(
                'Conversor °C - °F',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.white,),
              onTap: (){
                Navigator.pushNamed(context, '/conversor');
              },
            ),
            ListTile(
              tileColor: ColorApp.backPrimaryColorApp,
              leading: Icon(Icons.phone, color: Colors.white,),
              title: Text(
                'Intenciones',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.white,),
              onTap: (){
                Navigator.pushNamed(context, '/intenciones');
              },
            ),
            ListTile(
              tileColor: ColorApp.backPrimaryColorApp,
              leading: Icon(Icons.web, color: Colors.white,),
              title: Text(
                'API REST',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.white,),
              onTap: (){
                Navigator.pushNamed(context, '/populares');
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            ListTile(
              tileColor: ColorApp.backPrimaryColorApp,
              leading: Icon(Icons.exit_to_app, color: Colors.white,),
              title: Text(
                'Salir',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.white,),
              onTap: (){},
            ),
          ],
        ),
      ),
    );
  }
}