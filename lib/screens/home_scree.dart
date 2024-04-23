import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Keep Note', style: TextStyle(color: Colors.white),),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}