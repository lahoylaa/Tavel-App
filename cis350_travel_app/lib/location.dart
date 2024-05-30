import 'package:flutter/material.dart';
import 'package:cis350_travel_app/server.dart'; // Importing server.dart

class Location extends StatefulWidget {
  final String parameter;

  const Location({Key? key, required this.parameter}) : super(key: key);

  @override
  _LocationState createState() => _LocationState(); // Corrected class name
}

class _LocationState extends State<Location> {
  List<Map<String, dynamic>> locations = [];

  @override
  void initState() {
    super.initState();
    outputLocation();
  }

  Future<void> outputLocation() async {
      var locationData = await MongoDatabase.getLocation(widget.parameter);
      setState(() {
        locations = locationData!;
      });
  }

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
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(widget.parameter), // Display the parameter value
          ),
          Expanded(
            child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                var location = locations[index];
                return ListTile(
                  title: Text(location['location']),
                  subtitle: Text(location['location_rank']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
