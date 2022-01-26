import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBar(){
  return AppBar(
    backgroundColor: Colors.white,
    title: const Text("Shop",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
    actions: [

      IconButton(onPressed: (){}, icon: const Icon(Icons.menu,color: Colors.black,)),
      IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Colors.amber,)),
    ],
  );
}