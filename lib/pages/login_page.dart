import 'package:flutter/material.dart';
import 'package:flutter_app/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;
  final formKey=GlobalKey<FormState>();

  moveToHome(BuildContext context) async
  {
    if(formKey.currentState.validate()) {
      setState(() {
        changedButton = true;
      });
      await Future.delayed(Duration(seconds: 1));

      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changedButton = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.yellow,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 200.0,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter your User Name",
                          labelText: "User Name"),
                      validator: (value) {
                        if (value.isEmpty)
                          return "UserName cannot be empty";

                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter your Password",
                          labelText: "Password",
                      ),
                      validator: (value) {
                        if (value.isEmpty)
                          return "Password cannot be empty";
                        else if(value.length<6)
                          return"Password's length should be atleast 6";

                        return null;
                      },
                    ),



                    SizedBox(
                      height: 20.0,
                    ),
                    Material(
                      color: Colors.deepPurple,
                        borderRadius:
                        BorderRadius.circular(changedButton ? 50 : 0),
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap: ()=> moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changedButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changedButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),

                          ),
                        ),
                      ),

                    ]
                    // ElevatedButton(onPressed: (){
                    //   Navigator.pushNamed(context, MyRoutes.homeRoute);
                    // }, child:
                    // Text("Login"),
                    //     style: TextButton.styleFrom(
                    //       minimumSize: Size(120,40)
                    //     ),
                    // ),


                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
