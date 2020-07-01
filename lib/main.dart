import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myflutter/PokeDetails.dart';
import 'package:myflutter/PokeHub.dart';

void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "Poke App",
  theme: ThemeData(

    primaryColor: Colors.red,

  ),
  home: HomePage(),
));
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokeHub pokeHub;
  var url="https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Poke App"),),
    body: pokeHub==null ?Center(child: CircularProgressIndicator(),):GridView.count(crossAxisCount: 2,children: pokeHub.pokemon.map((Pokemon poke) =>
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>PokeDetails(pokemon: poke,)));
          },
          child: Card(
            elevation: 5.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Hero(
                  tag: poke.img,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(poke.img)),
                    ),
                  ),
                ),
                Text(poke.name,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        )).toList()),
    floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.refresh),),
      drawer: Drawer(),
    );

  }

  void fetchData() async {
    var res =await http.get(url);
    var decodeJson=jsonDecode(res.body);
    pokeHub=PokeHub.fromJson(decodeJson);
    print(pokeHub.toJson());
    setState(() {

    });

  }
}
