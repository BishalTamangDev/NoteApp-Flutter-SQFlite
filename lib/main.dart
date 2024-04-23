import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keep_note/screens/home_scree.dart';

void main(){
  runApp(const KeepNoteApp());
}

class KeepNoteApp extends StatelessWidget{
  const KeepNoteApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Keep Note',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}