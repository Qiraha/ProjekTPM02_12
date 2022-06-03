import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:poke_list/details.dart';
import 'package:poke_list/home.dart';
import 'package:poke_list/location.dart';
import 'package:poke_list/poke_bloc.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';

import 'login_page.dart';



void main() => runApp(PokeApp());

class PokeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
