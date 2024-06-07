import 'package:flutter/material.dart';
import 'server.dart';

/* Class to create location page of application */
class Location extends StatefulWidget {
  final String parameter;

/* Use this to add a parameter to the page routing */
  const Location({super.key, required this.parameter});

  @override
  _LocationState createState() => _LocationState(); 
}

/* Subclass to create functionality of the location page */
class _LocationState extends State<Location> {
  /* Variable for retreving documentation from database */
  List<Map<String, dynamic>> locations = [];

/* Intilization of state based on data from database */
  @override
  void initState() {
    super.initState();
    outputLocation();
  }

/* Function to call database and set state */
  Future<void> outputLocation() async {
      final locationData = await MongoDatabase.getLocation("Michigan");
      setState(() {
        locations = locationData!;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* Appbar UI */
      appBar: AppBar(
        title: const Text(
          'Travel App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,

        /* Structure for tab */
        /* Fix: Need implementation */
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),

      /* Location UI */
      body: Column(

        /* Adds location name to page based on user input*/
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(widget.parameter), // Display the parameter value
          ),

          /* Lists the data from database to body */
          Expanded(
            child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                var location = locations[index];
                return ListTile(
                  /* Fix: Implement sort */
                  title: Text('${index+1}. '+ location['location']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
