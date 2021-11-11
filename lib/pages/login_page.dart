import 'package:flutter/material.dart';
import 'package:full_app_devs/utills/routes.dart';
import '../utills/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Color getColor(Set<MaterialState> states) {
    //   const Set<MaterialState> interactiveStates = <MaterialState>{
    //     MaterialState.pressed,
    //     MaterialState.hovered,
    //     MaterialState.focused,
    //   };
    //   if (states.any(interactiveStates.contains)) {
    //     return Colors.blue;
    //   }
    //   return Colors.green;
    // }

    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Please enter your credential",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter Username', labelText: 'username'),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Enter Password', labelText: 'password'),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                child: Text('Login'),
                // style: ButtonStyle(
                //     backgroundColor: MaterialStateProperty.resolveWith(
                //         (Set<MaterialState> states) => Colors.green),
                //     padding: MaterialStateProperty.resolveWith((states) =>
                //         EdgeInsets.symmetric(
                //             vertical: 12.0, horizontal: 50.0))),
                style: TextButton.styleFrom(
                    minimumSize: Size(150, 40), backgroundColor: Colors.green),
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.homeRoute);
                  print('hi masud osman');
                },
              )
            ],
          ),
        ));
  }
}
