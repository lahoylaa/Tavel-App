import 'package:flutter/material.dart';
import 'package:cis350_travel_app/main.dart';
import 'server.dart';
import 'info.dart';
import 'tab.dart';
import 'home.dart';

class Saved extends StatefulWidget{
  const Saved({super.key});


  @override
  SavedState createState() => SavedState();
}


class SavedState extends State<Saved>{
  String sLocations = '';
  String userName = '';
  String userEmail = '';
  String userId = '';
  String userPassword = '';
  String currentEmail = '';


  @override
  void initState() {
    super.initState();
    loadUserInformation();
  }
 
  Future<void> loadUserInformation() async {
    try {


      final currentUser = await MongoDatabase.getObjectId(currentUserId);
      if(currentUser != null){
        currentEmail = currentUser['email'];
      }else{
        print('Error: Current User Info Was Not Received');
        return;
      }
      // Fetch user information from MongoDB
      final userInfo = await MongoDatabase.getUserAuthentication(currentEmail);
     
      setState(() {
        // Update state variables with fetched data
        userName = userInfo != null ? userInfo['locations_id'] : '';
      });
    } catch (e) {
      print('Error loading user information: $e');
      // Handle error gracefully, e.g., show a snackbar or alert dialog
    }
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
 
    body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              ListTile(
                title: Text('Location: $userName'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
