import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/PokeHub.dart';
class PokeDetails extends StatelessWidget {
  Pokemon pokemon;
  PokeDetails({this.pokemon});

  bodyWidget(BuildContext context)=>Stack(
    children: <Widget>[
    Positioned(
        height: MediaQuery.of(context).size.height/1.4,
        width: MediaQuery.of(context).size.width - 20,
        left: 10.0,
        top: MediaQuery.of(context).size.height *0.1,
        child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: 75,
          ),
          Text(pokemon.name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25.0),),
          Text("Height : ${pokemon.height}"),
          Text("Weight : ${pokemon.weight}"),
          Text("Types",style: TextStyle(fontWeight: FontWeight.bold),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: pokemon.type.map((t) => FilterChip(
              backgroundColor: Colors.amber,
                label: Text(t),
                onSelected: (b){}
                )).toList(),
          ),
          Text("Weakness",style: TextStyle(fontWeight: FontWeight.bold),),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: pokemon.weaknesses.map((w) => FilterChip(
                backgroundColor: Colors.red,
                  label: Text(w,style: TextStyle(color: Colors.white),),
                  onSelected: (b){}
              )).toList(),
          ),
          Text("Next Evolutions",style: TextStyle(fontWeight: FontWeight.bold),),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: pokemon.nextEvolution==null ? <Widget>[Text("This is Final Form")]:pokemon.nextEvolution.map((n) => FilterChip(
                backgroundColor: Colors.blue,
                  label: Text(n.name,style: TextStyle(color: Colors.white),),
                  onSelected: (b){}
              )).toList(),
          ),

        ],
      ),
    )),
      Align(
        alignment: Alignment.topCenter,
        child: Hero(tag: pokemon.img, child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            image:  DecorationImage(image: NetworkImage(pokemon.img),fit: BoxFit.cover)
          ),
        )),
      )
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.cyan,
        title: Text(pokemon.name),
      ),
      body: bodyWidget(context),
    );
  }
}
