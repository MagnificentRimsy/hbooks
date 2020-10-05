import 'package:flutter/material.dart';
import 'package:flutter_app/book.dart';
import 'package:flutter_app/login.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(
    MaterialApp(
      home: RegisterPage(),
    ),
  );
}

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = FirebaseAuth.instance;
  


  String name;
  String email;
  String password;


  @override
  // void initState() {
  //   super.initState();
  //   Firebase.initializeApp().whenComplete(() {
  //     print("completed");
  //     setState(() {});
  //   });
  // }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  // screen header
                  SizedBox(height: 20.0),
                  Hero(
                    tag: 'logo',
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 120.0,
                      width: 120.0,
                    ),
                  ),
                  SizedBox(height: 40.0),
                  //forms
                  Container(
                    width: 300.0,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Fullname',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        filled: true,
                        fillColor: Colors.grey[300],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                  ),

                  SizedBox(height: 20.0),
                  //forms
                  Container(
                    width: 300.0,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'example@gmail.com',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        filled: true,
                        fillColor: Colors.grey[300],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                  ),

                  SizedBox(height: 20.0),
                  //forms
                  Container(
                    width: 300.0,
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'password',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        filled: true,
                        fillColor: Colors.grey[300],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                  ),

                  SizedBox(height: 20.0),
                  //forms
                  Container(
                    width: 300.0,
                    child: TextFormField(
                      // controller: TextConfirmPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'confirm password',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        filled: true,
                        fillColor: Colors.grey[300],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    padding: EdgeInsets.fromLTRB(120, 20, 120, 20),
                    color: Hexcolor("#043e2a"),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        if (newUser != null) {
                          //Do something
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookPage(),
                            ),
                          );
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Or Login to Continue',
                        style: TextStyle(
                          color: Hexcolor("#7BB062"),
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,  
                        ),
                        
                      ),
                      
                    
                    ),
                    margin: EdgeInsets.only(bottom: 40.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
