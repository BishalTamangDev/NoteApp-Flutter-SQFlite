import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/note_widget.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Keep Note', style: TextStyle(color: Colors.white),),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              NoteWidget(),
              NoteWidget(),
              NoteWidget(),
              NoteWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
      //   navigate to another screen -> Add Note Screen
      }, child: const Icon(Icons.add, color: Colors.white,),

      ),
    );
  }
}