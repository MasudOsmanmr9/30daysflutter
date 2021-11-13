import 'package:flutter/material.dart';
import 'package:full_app_devs/utills/routes.dart';
import '../utills/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();

  moveTOHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(milliseconds: 1000));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

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
          child: Form(
            key: _formkey,
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
                  "Please enter your credential $name",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Enter Username', labelText: 'username'),
                        validator: (value) => value != null
                            ? value.isEmpty
                                ? 'password can\'t be empty'
                                : null
                            : null,
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (value) {
                          print('accessing this part 1');
                          value != null ? print(value.length) : '';
                          if (value != null && value.isEmpty) {
                            return 'password can\'t be empty';
                          } else if (value != null && value.length < 6) {
                            print('accessing this part 3');
                            return 'at least 6 charectar needed';
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter Password', labelText: 'password'),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(changeButton ? 50 : 10.0),
                  child: InkWell(
                    splashColor: Colors.red,
                    onTap: () => moveTOHome(context),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 1000),
                      width: changeButton ? 50 : 150,
                      height: 50,

                      // alignment: Alignment(0, 0),
                      alignment: Alignment.center,

                      child: changeButton
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),

                // ElevatedButton(
                //   child: Text('Login'),
                //   // style: ButtonStyle(
                //   //     backgroundColor: MaterialStateProperty.resolveWith(
                //   //         (Set<MaterialState> states) => Colors.green),
                //   //     padding: MaterialStateProperty.resolveWith((states) =>
                //   //         EdgeInsets.symmetric(
                //   //             vertical: 12.0, horizontal: 50.0))),
                //   style: TextButton.styleFrom(
                //       minimumSize: Size(150, 40), backgroundColor: Colors.green),
                //   onPressed: () {
                //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                //     print('hi masud osman');
                //   },
                // )
              ],
            ),
          ),
        ));
  }
}
