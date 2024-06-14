import 'package:cis350_travel_app/server.dart';
import 'package:flutter/material.dart';
import 'location.dart';
import 'tab.dart';

/* Class to create home page of application */
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _myHomeState createState() => _myHomeState();
}

/* Subclas to create functionality of  the home page */
class _myHomeState extends State<Home> {

  /* Variables for tab bar */
  /* 
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
  */

  @override
  Widget build(BuildContext context) {
    /* Variable for search bar user input*/
    final myLocationController = TextEditingController();

    /* Output of the class to the application */
    return MaterialApp(
      home: Scaffold(
        /*defines drawer from tab.dart*/
        drawer: const PubDrawer(),
        /* Appbar UI */
        appBar: AppBar(
          title: const Text('Travel App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: Colors.blue,
          centerTitle: true,
          /*For future pages that need menu on right side*/
          leading: Container(),
          actions: <Widget>[
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ),
          ],
        ),
        endDrawer: const PubDrawer(),

        /* Home UI */
        body: Container(
          /* Background Image */
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/testpic1.jpg"),
            fit: BoxFit.cover,
          )),

          /* Search bar */
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Explore',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                  ),

                  /* Userinput authentication in database */
                  onFieldSubmitted: (value) async {
                    final locationEntry = await MongoDatabase.getLocation(value);

                    /*  Error Checking: Database does not have location */
                    if (locationEntry != null) {

                      /* Route to location page */
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Location(parameter: value);
                          },
                        ),
                        (route) => false,
                      );
                    } 
                    else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                                content: Text(
                              'Location Does Not Exist',
                              textAlign: TextAlign.center,
                            ));
                          });
                    }
                  },
                ),
              )
            ],
          ),
        )));
  }
}
