import 'package:flutter/material.dart';

class Food extends StatefulWidget {
  const Food({super.key});

  @override
  _myFoodState createState() => _myFoodState();
}

class _myFoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Travel App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      body: const putTextCenter(),
    );
  }
}

class putTextCenter extends StatelessWidget{
  const putTextCenter({super.key});

   @override
  Widget build(BuildContext context){
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10), 
          child: Text('Here')),
      ],
    );
  }
}
