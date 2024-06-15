import 'package:flutter/material.dart';
import 'server.dart';
import 'info.dart';

// Testing
import 'Home.dart';

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
    // fix this it wont work with wdiget.parameter
    final locationData = await MongoDatabase.getLocation(widget.parameter);
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
          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: Text(widget.parameter), // Display the parameter value
          // ),

          /* Lists the data from database to body */
          Expanded(
              flex: 3, // changes the size of the body
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/${widget.parameter}Main.jpg"),
                        fit: BoxFit.cover)),
              )),

          const SizedBox(
            height: 15,
          ),

          Expanded(
              flex: 6,
              child: Center(
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: locations.length,
                      itemBuilder: (context, index) {
                        var location = locations[index];
                        return MaterialButton(
                            minWidth: 10.0,
                            // Testing for boundaries of the button
                            //color: Colors.red,
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return Info(
                                        parameter: widget.parameter,
                                        city: index);
                                  },
                                  //return const Home();
                                ),
                                (route) => false,
                              );
                            },
                            child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 5.0),
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: ListTile(
                                  title: Text(
                                    '${index + 1}. ' + location['location'],
                                  ),
                                )));
                      }))),
        ],
      ),
    );
  }
}
