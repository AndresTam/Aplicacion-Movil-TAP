import 'package:practica2_tap/settings/color_settings.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextEditingController txtUserController = TextEditingController();
    TextEditingController txtPassController = TextEditingController();
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/Fondo2.jpg')),
            ),
          ),
          Card(
            color: ColorApp.backSecondaryColorApp,
            margin: EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  TextFormField(
                    controller: txtUserController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      hintText: 'Email User',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: txtPassController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      hintText: 'Password User',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    obscureText: true,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            child: FloatingActionButton(
              splashColor: ColorApp.splashColorApp,
              backgroundColor: ColorApp.colorButton,
              child: Icon(Icons.add),
              onPressed: (){
                // print(txtUserController.text);
                // print(txtPassController.text);

                //Navegacion udando una instanciando el objeto de la UI
                // Navigator.push(
                //   context, MaterialPageRoute(
                //     builder:(context) => DashboardScreen()
                //   ),
                // );

                //Navegacion usando rutas nombradas
                Navigator.pushNamed(context, '/dashboard');
              },
            ),
          ),
        ],
      ),
    );
  }
}