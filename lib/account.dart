import 'package:cis350_travel_app/main.dart';
import 'package:flutter/material.dart';
import 'tab.dart';
import 'home.dart';
import 'server.dart';

// void main() async {
//   runApp(const MaterialApp(
//     title: 'Navigation Basics',
//     home: Account(),
//   ));
// }

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  AccountState createState() => AccountState();
}

class AccountState extends State<Account> {
  final originalPasswordController = TextEditingController();
  final updatedPasswordController = TextEditingController();
  final updatedPasswordController2 = TextEditingController();

  String userName = '';
  String userEmail = '';
  String userId = '';
  String userPassword = '';
  String currentEmail = '';

  @override
  void initState() {
    super.initState();
    // Load user information when the screen initializes
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
        userName = userInfo != null ? userInfo['name'] : '';
        userEmail = userInfo != null ? userInfo['email'] : '';
        userPassword = userInfo != null ? userInfo['password'] : '';
      });
    } catch (e) {
      print('Error loading user information: $e');
      // Handle error gracefully, e.g., show a snackbar or alert dialog
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const PubDrawer(),
      appBar: AppBar(
        title: const Text(
          'Account Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
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
              const Text(
                'User Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: Text('Name: $userName'),
              ),
              ListTile(
                title: Text('Email: $userEmail'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: originalPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Current Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: updatedPasswordController,
                decoration: const InputDecoration(
                  labelText: 'New Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: updatedPasswordController2,
                decoration: const InputDecoration(
                  labelText: 'Re-Enter Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (originalPasswordController.text == userPassword){

                  if(updatedPasswordController.text == updatedPasswordController2.text) {
                    await MongoDatabase.updatePassword(
                      currentUserId,
                      updatedPasswordController.text,
                    );
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text(
                            'Password updated successfully',
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    );
                  } else {
                    /* Error checking: Mismatch password */
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text(
                            'Passwords do not match',
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    );
                  }
                  }else{
                    /* Error checking: Wrong current password */
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text(
                            'Wrong current password',
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    );
                  }
                },
                child: const Text('Change Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
