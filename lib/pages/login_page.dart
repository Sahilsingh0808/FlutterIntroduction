import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.red,
      child: Column(
      children:[
        Image.asset("assets/images/login.png",
        fit: BoxFit.cover,),
        SizedBox(
          height: 20.0,

        ),
        Text("Welcome",
          style: TextStyle(fontSize: 22,
            fontWeight: FontWeight.bold,),
        ),
        SizedBox(
          height: 20.0,

        ),


      Padding(padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Enter your User Name",
                  labelText: ("User Name")
              ),

            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Enter your Password",
                  labelText: ("Password")
              ),

            ),



           SizedBox(
        height: 20.0,

      ),
      ElevatedButton(onPressed: (){
        print("hi Sahil");
      }, child:
      Text("Login"),
          style: TextButton.styleFrom()
      ),
          ],
      ),
      ),
      ],
      ),
        );



  }
}
