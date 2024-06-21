import 'package:flutter/material.dart';
import 'package:cis350_travel_app/main.dart';
import 'server.dart';
import 'tab.dart';
import 'home.dart';
import 'location.dart';

class Info extends StatefulWidget {
  final String parameter;
  final int city;

  /* Use this to add a parameter to the page routing */
  const Info({super.key, required this.parameter, required this.city});

  @override
  InfoState createState() => InfoState();
}

class InfoState extends State<Info> {
  /* Variable for retrieving documentation from database */
  List<Map<String, dynamic>> locations = [];
  var user;

  /* Initialization of state based on data from database */
  @override
  void initState() {
    super.initState();
    outputLocation();
    user = userID();
  }

  static Future<Map<String, dynamic>?> userID() async {
    final currentUser = await MongoDatabase.getObjectId(currentUserId);
    return currentUser;
  }

  /* Function to call database and set state */
  Future<void> outputLocation() async {
    final locationData = await MongoDatabase.getLocation(widget.parameter);
    setState(() {
      locations = locationData!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(        /*defines drawer from tab.dart*/
        drawer: const PubDrawer(),
        /* Appbar UI */
        appBar: AppBar(
          title: Text(locations.isNotEmpty
                                ? locations[widget.city]['location']
                                : '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: Colors.blue,
          centerTitle: true,
          /*For future pages that need menu on right side*/
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Location(parameter: widget.parameter);
                          },
                        ),
                        (route) => false,
                      );
            }
          ),
          
          actions: <Widget>[
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ),
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  MongoDatabase.saveLocation(user, widget.parameter);
              },
            ),
          ),
         ],
        ),
        endDrawer: const PubDrawer(),
    
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top column
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/${(locations.isNotEmpty || (locations[widget.city]['image_name'] == null)) ? locations[widget.city]['image_name'] : 'NoImage.jpg'}",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Center(
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      'Most Known',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    // List of things underneath 'Most Known'
                    subtitle: ListView(
                      shrinkWrap: true,
                      children: [
                        ListTile(
                          title: Text(
                            locations.isNotEmpty
                                ? locations[widget.city]['most_known_1']
                                : '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            locations.isNotEmpty
                                ? locations[widget.city]['most_known_2']
                                : '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            locations.isNotEmpty
                                ? locations[widget.city]['most_known_3']
                                : '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // Bottom row with two columns
          Expanded(
            flex: 7,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First bottom column (Restaurants)
                Expanded(
                  flex: 1,
                  child: ListView(
                    children: [
                      ListTile(
                        title: Text(
                          '   Restaurants',
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        // List of things underneath 'Restaurants'
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(
                                locations.isNotEmpty
                                    ? locations[widget.city]['food_1']
                                    : '',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                locations.isNotEmpty
                                    ? locations[widget.city]['food_2']
                                    : '',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                locations.isNotEmpty
                                    ? locations[widget.city]['food_3']
                                    : '',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Second bottom column (Attractions)
                Expanded(
                  flex: 1,
                  child: ListView(
                    children: [
                      ListTile(
                        title: Text(
                          '   Attractions',
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        // List of things underneath 'Attractions'
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(
                                locations.isNotEmpty
                                    ? locations[widget.city]['attraction_1']
                                    : '',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                locations.isNotEmpty
                                    ? locations[widget.city]['attraction_2']
                                    : '',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                locations.isNotEmpty
                                    ? locations[widget.city]['attraction_3']
                                    : '',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
