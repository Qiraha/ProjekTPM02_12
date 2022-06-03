import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:poke_list/details.dart';
import 'package:poke_list/home.dart';
import 'package:poke_list/location.dart';
import 'package:poke_list/poke_bloc.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';



class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child:
              Image.asset(
                'images/banner.png',
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: 200),
                  _usernameField(),
                  _passwordField(),
                  _loginButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black,
            fontSize: 20.0,
          ),
          onChanged: (value) {
            username = value;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white70,
            hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
            hintText: "Username",
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                    color: (isLoginSuccess) ? Colors.blue : Colors.red)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: Colors.green)),
          ),
        ));
  }

  Widget _passwordField() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.black
          ),
          onChanged: (value) {
            password = value;
          },
          obscureText: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white70,
            hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
            hintText: "Password",
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                    color: (isLoginSuccess) ? Colors.blue : Colors.red)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: Colors.green)),
          ),
        ));
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: 200.0,
      height: 60.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: (isLoginSuccess) ? Colors.blue : Colors.red,
        ),
        onPressed: () {
          String pesan = "";
          if (password == "pokemon" && username == "pokemon") {
            setState(() {
              pesan = "Login Success";
              isLoginSuccess = true;
            });
            Navigator.push(context, MaterialPageRoute(builder: (context) => MaterialApp(
              home: PokeBlocState(
                child: HomeScreen(),
              ),
            ),
            ),
            );
          } else {
            setState(() {
              pesan = "Login Failed";
              isLoginSuccess = false;
            });
          }
          SnackBar snackBar = SnackBar(
            content: Text(pesan),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('Login'),
      ),
    );
  }
}
