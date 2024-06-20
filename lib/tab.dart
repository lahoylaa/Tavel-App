import 'package:flutter/material.dart';
import 'main.dart';
import 'home.dart';
import 'saved.dart';
import 'account.dart';

/* Creates the side menu for pages, can be easily called */
class PubDrawer extends StatefulWidget{
  const PubDrawer({super.key});

  @override
  _myTabState createState() => _myTabState();
}

class _myTabState extends State<PubDrawer>{
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    /* Tab UI */
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Text('Menu'),
        ),
        /* Button for home */
        ListTile(
            title: const Text('Home'),
            selected: selectedIndex == 0,
            onTap: () {
              onItemTapped(0);
              Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const Home();
                  },
                ),
                (route) => false,
              );
            }),
        ListTile(
            title: const Text('Saved Locations'),
            selected: selectedIndex == 1,
            onTap: () {
              onItemTapped(1);
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                return const Saved();
              },),);
            }),
        /* Button for Account Settings */
        ListTile(
            title: const Text('Account Settings'),
            selected: selectedIndex == 2,
            onTap: () {
              onItemTapped(2);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const Account();
                  },
                ),
                (route) => false,
              );
            }),
        /* Button to Sign Out */
        ListTile(
            title: const Text('Sign Out'),
            selected: selectedIndex == 3,
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    //"Sign Out" by routing back to login
                    return const MyApp();
                  },
                ),
                (route) => false,
              );
            })
      ],
    ));
  }
}