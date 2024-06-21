import 'package:flutter/material.dart';
import 'package:cis350_travel_app/main.dart';
import 'server.dart';
import 'info.dart';
import 'tab.dart';
import 'home.dart';

// void main() async {
//   runApp(const MaterialApp(
//     title: 'Navigation Basics',
//     home: Saved(),
//   ));
// }

class Saved extends StatefulWidget{
  const Saved({super.key});

  @override
  SavedState createState() => SavedState();
}

class SavedState extends State<Saved>{
  List<Map<String, dynamic>> sLocations = [];

  @override
  void initState() {
    super.initState();
    loadUserID();
  }

 Future<void> loadUserID() async {
  List<Map<String, dynamic>> savedLocations = [];
    try {
      final currentUser = await MongoDatabase.getObjectId(currentUserId);
      if(currentUser != null){
        savedLocations = currentUser['locations_id'];
      }else{
        print('Error: Current User Info Was Not Received');
      }
    } catch (e) {
      print('Error loading user information: $e');
      // Handle error gracefully, e.g., show a snackbar or alert dialog
    }
    setState(() {
      sLocations = savedLocations;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: const PubDrawer(),
      appBar: AppBar(
        title: const Text('Saved Locations',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Home();
              },
            ),
            (route) => false,
          );
        },
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
      ],
    ),
    endDrawer: const PubDrawer(),
    body: Column(
        /* Adds location name to page based on user input*/
        children: [
          Expanded(
              flex: 6,
              child: Center(
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: sLocations.length,
                      itemBuilder: (context, index) {
                        var location = sLocations[index];
                        ListTile(
                          title: Text(
                             '${index + 1}. ' + location['location'],
                          ),
                        );
                        // return MaterialButton(
                        //     minWidth: 10.0,
                        //     // Testing for boundaries of the button
                        //     //color: Colors.red,
                        //     onPressed: () {
                        //       Navigator.pushAndRemoveUntil(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (BuildContext context) {
                        //             return Info(
                        //                 parameter: widget.parameter,
                        //                 city: index);
                        //           },
                        //           //return const Home();
                        //         ),
                        //         (route) => false,
                        //       );
                        //     },
                        //     child: Container(
                        //         margin: EdgeInsets.symmetric(
                        //             vertical: 5.0, horizontal: 5.0),
                        //         padding: EdgeInsets.all(5.0),
                        //         decoration: BoxDecoration(
                        //           border: Border.all(
                        //             color: Colors.blue,
                        //             width: 2.0,
                        //           ),
                        //           borderRadius: BorderRadius.circular(10.0),
                        //         ),
                        //         child: ListTile(
                        //           title: Text(
                        //           '${index + 1}. ' + location['location'],
                        //           ),
                        //         )));
                      }))),
        ],
      ),
    );
  }
}
