import 'package:flutter/material.dart';
import 'server.dart';

class Info extends StatefulWidget {
  final String parameter;
  final int city;

/* Use this to add a parameter to the page routing */
  const Info({super.key, required this.parameter, required this.city});

  @override
  InfoState createState() => InfoState();
}

class InfoState extends State<Info> {
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
    final locationData = await MongoDatabase.getLocation(widget.parameter);
    setState(() {
      locations = locationData!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Top column
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/${locations.isNotEmpty ? locations[widget.city]['image_name'] : ''}"),
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
          title: const Text('Most Known',
          textAlign: TextAlign.center,),
         
          // List of things underneath 'Most Known'
          subtitle: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: Text(locations.isNotEmpty ? locations[widget.city]['most_known_1']:''),
              ),
              ListTile(
                title: Text(locations.isNotEmpty ? locations[widget.city]['most_known_2']:''),
              ),
              ListTile(
                title: Text(locations.isNotEmpty ? locations[widget.city]['most_known_3']:''),
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
              children: [
                // First bottom column
                Expanded(
                  flex: 1,
                  child: ListView(
                    children: [
                      ListTile(
                        title: const Text('Restaurants', textAlign: TextAlign.justify,),
                        // List of things underneath 'Restaurants'
                        subtitle: ListView(
                          shrinkWrap: true,
                          children: [
                            ListTile(
                              title: Text(locations.isNotEmpty ? locations[widget.city]['food_1']:''),
                            ),
                            ListTile(
                              title: Text(locations.isNotEmpty ? locations[widget.city]['food_2']:''),
                            ),
                            ListTile(
                              title: Text(locations.isNotEmpty ? locations[widget.city]['food_3']:''),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Second bottom column
                Expanded(
                  flex: 1,
                  child: ListView(
                    children: [
                      ListTile(
                        title: const Text('Attractions'),
                        // List of things underneath 'Attractions'
                        subtitle: ListView(
                          shrinkWrap: true,
                          children: [
                            ListTile(
                              title: Text(locations.isNotEmpty ? locations[widget.city]['attraction_1']:''),
                            ),
                            ListTile(
                              title: Text(locations.isNotEmpty ? locations[widget.city]['attraction_2']:''),
                            ),
                            ListTile(
                              title: Text(locations.isNotEmpty ? locations[widget.city]['attraction_3']:''),
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
